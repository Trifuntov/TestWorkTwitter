//
//  extentionDate.swift
//  TestWorkForXDesign
//
//  Created by Igor Trifuntov on 01.11.2020.
//

import Foundation

extension Date {
    
    func dateFormat(string: String?) -> String? {
        guard let string = string else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E MMM d HH:mm:ss Z yyyy"
        guard let date = dateFormatter.date(from: string) else { return nil }
        dateFormatter.dateFormat = "MMM dd,yyyy"
        return dateFormatter.string(from: date)
    }
}
