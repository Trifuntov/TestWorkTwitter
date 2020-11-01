//
//  ViewController.swift
//  TestWorkForXDesign
//
//  Created by Igor Trifuntov on 01.11.2020. 
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var twitterApi = TwitterApi()
    private var twitts: [TwittRo]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    func loadData() {
        twitterApi.getTwitts { [weak self] twitts in
            self?.twitts = twitts
            self?.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return twitts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
        cell.lableText.text = twitts?[indexPath.row].text
        cell.dateLabel.text = Date().dateFormat(string: twitts?[indexPath.row].created_at)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "@" + Constant.nameAccount.rawValue
    }
}













