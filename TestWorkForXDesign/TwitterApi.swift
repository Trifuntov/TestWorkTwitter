//
//  TwitterApi.swift
//  TestWorkForXDesign
//
//  Created by Igor Trifuntov on 01.11.2020. 
//

import Foundation

class TwitterApi {
    
    private func base64EncodedToken() -> String {
        let keyAndSecret = String(format: "%@:%@",
                                  Constant.consumerKey.rawValue,
                                  Constant.consumerSecret.rawValue)
        let secretAndKeyData = keyAndSecret.data(using: String.Encoding.utf8)
        let base64EncodedToken = secretAndKeyData?.base64EncodedString()
        return base64EncodedToken ?? ""
    }
    
    // Auth Token
    private func getToken(completion: @escaping (String?) -> Void) {
        var request = URLRequest(url: URL(string: Constant.authUrl.rawValue)!)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("Basic \(base64EncodedToken())", forHTTPHeaderField: "Authorization")
        request.httpBody = "grant_type=client_credentials".data(using: .utf8)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let decoder = JSONDecoder()
            if let data = data, let token = try? decoder.decode(TokenRo.self, from: data).access_token {
                completion(token)
            } else {
                completion(nil)
            }
        }.resume()
    }
    
    // load Twitts
    func getTwitts(comletion: @escaping ([TwittRo]?) -> Void) {
        getToken { token in
            guard let token = token else { comletion(nil); return }
            guard let url = URL(string: String(format: Constant.apiTwitter.rawValue, Constant.nameAccount.rawValue)) else { comletion(nil); return }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            let tokenString = "Bearer " + token
            request.addValue(tokenString, forHTTPHeaderField: "Authorization")
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if let data = data, let twitts = try? JSONDecoder().decode([TwittRo].self, from: data) {
                    DispatchQueue.main.async {
                        comletion(twitts)
                    }
                } else {
                    DispatchQueue.main.async {
                        comletion(nil)
                    }
                }
            }.resume()
        }
    }
}
