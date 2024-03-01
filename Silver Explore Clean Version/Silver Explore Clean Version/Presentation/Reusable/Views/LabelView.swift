//
//  LabelView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/1/24.
//

import UIKit

final class LabelView: UIView {
    private var label: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
//        self.backgroundColor = .brown
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.addSubview(self.label)
        
        self.label.centerXAnchor(self.centerXAnchor).centerYAnchor(self.centerYAnchor)
    }
    
    @discardableResult
    func label(_ text: String) -> Self {
        self.label.text = text
        
        return self
    }
}
