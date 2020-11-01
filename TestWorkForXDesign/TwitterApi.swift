//
//  TwitterApi.swift
//  TestWorkForXDesign
//
//  Created by IgoriOSDev on 01.11.2020. 
//

import Foundation

class TwitterApi {
    
    var twitts = [TwittStruct]()
    
    // encoded token
    func base64EncodedToken() -> String {
        let KeyAndSecret = String(format: "%@:%@", constant.consumerKey.rawValue, constant.consumerSecret.rawValue)
        let secretAndKeyData = KeyAndSecret.data(using: String.Encoding.utf8)
        let base64EncodedToken = secretAndKeyData?.base64EncodedString()
        return base64EncodedToken ?? ""
    }
    
    // obtain bearerToken and get data
    func getData(url:String, completion:@escaping () -> Void) {
        
        var request = URLRequest(url: URL(string: constant.authUrl.rawValue)!)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("Basic \(base64EncodedToken())", forHTTPHeaderField: "Authorization")
        request.httpBody = "grant_type=client_credentials".data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
           // print(response)
            guard let data = data else { return }
            do {
                if let results: NSDictionary = try JSONSerialization .jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments  ) as? NSDictionary {
                    guard let bearerToken = results["access_token"] as? String else { return }
                    guard let url = URL(string: url) else { return }
                    var request = URLRequest(url: url)
                    request.httpMethod = "GET"
                    let token = "Bearer " + bearerToken
                    request.addValue(token, forHTTPHeaderField: "Authorization")
                    URLSession.shared.dataTask(with: request) { (data, response, error) in
                        
                        guard let data = data else { return }
                        guard error == nil else { return }
                        do {
                            self.twitts = try JSONDecoder().decode([TwittStruct].self, from: data)
                            DispatchQueue.main.async {
                                completion()
                            }
                        } catch let error {
                            print("Error: ", error)
                        }
                    }.resume()
                }
            } catch let error {
                print("Error: ", error)
            }
        }.resume()
    }
}
