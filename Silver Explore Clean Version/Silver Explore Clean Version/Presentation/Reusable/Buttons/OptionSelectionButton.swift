//
//  OptionSelectionButton.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/2/24.
//

import UIKit

final class OptionSelectionButton: UIButton {

    init(productOptionName: String, textColor: UIColor = .black, backgroundColor: UIColor = .silverLight)
    {
        super.init(frame: .zero)
        self.setTitle(productOptionName, for: .normal)
        self.titleLabel?.textColor = .black
        self.backgroundColor = backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
