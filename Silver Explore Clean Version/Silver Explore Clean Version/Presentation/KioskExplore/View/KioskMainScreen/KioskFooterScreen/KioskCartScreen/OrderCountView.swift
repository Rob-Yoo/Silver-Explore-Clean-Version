//
//  TotalOrderCountView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/1/24.
//

import UIKit

final class OrderCountView: UIView {
    private(set) lazy var titleLabel = makeLabel(text: "총 수량")
    private(set) lazy var countLabel = makeLabel(text: "0개")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeLabel(text: String) -> UILabel {
        let label = UILabel()
        
        label.text = text
        label.textColor = .black
        label.font = .systemFont(ofSize: 25, weight: .regular)
        label.textAlignment = .center
        return label
    }
    
    private func configure() {
        self.configureTitleLabel()
        self.configureCountLabel()
    }
    
    private func configureTitleLabel() {
        self.addSubview(self.titleLabel)
        
        self.titleLabel
            .leadingAnchor(self.leadingAnchor, padding: 10)
            .centerYAnchor(self.centerYAnchor)
    }
    
    private func configureCountLabel() {
        self.addSubview(self.countLabel)
        
        self.countLabel
            .trailingAnchor(self.trailingAnchor, padding: -5)
            .centerYAnchor(self.centerYAnchor)
    }
}

