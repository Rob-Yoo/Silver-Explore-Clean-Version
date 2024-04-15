//
//  SegmentedControl.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 4/15/24.
//

import UIKit

class SegmentedControl: UISegmentedControl {
    init(items: [Any], defaultIndex: Int = 0) {
        super.init(items: items)
        self.selectedSegmentIndex = defaultIndex
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.selectedSegmentTintColor = .white
        self.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        self.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 20, weight: .semibold)], for: .normal)
    }
}
