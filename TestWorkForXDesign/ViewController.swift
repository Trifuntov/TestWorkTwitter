//
//  ViewController.swift
//  TestWorkForXDesign
//
//  Created by IgoriOSDev on 01.11.2020. 
//

import UIKit

class ViewController: UIViewController {
    
    private var twitterApi = TwitterApi()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        self.twitterApi.getData(url: String(format: constant.apiTwitter.rawValue, constant.nameAccount.rawValue), completion: { self.tableView.reloadData() })
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return twitterApi.twitts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
        cell.lableText.text = twitterApi.twitts[indexPath.row].text
        cell.dateLabel.text = Date().dateFormat(string: twitterApi.twitts[indexPath.row].created_at)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "@" + constant.nameAccount.rawValue
    }
}













