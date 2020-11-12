//
//  CellTableViewCell.swift
//  TestWorkForXDesign
//
//  Created by Igor Trifuntov on 01.11.2020.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var lableText: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
