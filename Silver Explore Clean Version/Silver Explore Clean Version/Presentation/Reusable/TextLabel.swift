//
//  TextLabel.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 4/15/24.
//

import UIKit

class TextLabel: UILabel {
    init(text: String, textColor: UIColor = .black) {
        super.init(frame: .zero)
        self.text = text
        self.textColor = textColor
        self.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    func textAlignment(_ alignment: NSTextAlignment) -> Self {
        self.textAlignment = alignment
        return self
    }
}
