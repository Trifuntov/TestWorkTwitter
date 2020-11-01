//
//  CellTableViewCell.swift
//  TestWorkForXDesign
//
//  Created by IgoriOSDev on 01.11.2020.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var lableText: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
