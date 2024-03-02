//
//  SeparatorLineView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/2/24.
//

import UIKit

final class SeparatorLineView: UIView {
    init(color: UIColor = .silverLight) {
        super.init(frame: .zero)
        self.backgroundColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
