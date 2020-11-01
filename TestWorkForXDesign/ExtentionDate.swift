//
//  extentionDate.swift
//  TestWorkForXDesign
//
//  Created by IgoriOSDev on 01.11.2020.
//

import Foundation

extension Date {
    func dateFormat(string: String?) -> String? {
        guard let string = string else { return nil }
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "E MMM d HH:mm:ss Z yyyy"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        
        let date: Date? = dateFormatterGet.date(from: string)
        guard let dateFormat = date  else { return nil }
        return dateFormatterPrint.string(from: dateFormat)
    }
}
