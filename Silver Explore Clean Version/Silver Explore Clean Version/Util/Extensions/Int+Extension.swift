//
//  Int+Extension.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 4/15/24.
//

import Foundation

extension Int {
    var decimalFormattedString: String {
        let formattedString: String
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        formattedString = numberFormatter.string(from: NSNumber(value: self))!
        return formattedString
    }
}
