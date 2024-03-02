//
//  ProductOptionStackView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/2/24.
//

import UIKit

final class ProductOptionStackView: UIStackView {
    private let productOption = ProductOption.init()

    private(set) var temparatureOptionView = UIView()
    private(set) var sizeOptionView = UIView()
    private(set) lazy var iceQuantityOptionView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fillEqually
        
        self.configureTemparatureOptionView()
        self.configureSizeOptionView()
        self.configureIceQuantityOptionView()
    }
    
    private func configureTemparatureOptionView() {
        self.addArrangedSubview(self.temparatureOptionView)
        
        self.temparatureOptionView
            .widthAnchor(self.widthAnchor, multiplier: 0.7)
            .centerXAnchor(self.centerXAnchor)
    }
    
    private func configureSizeOptionView() {
        self.addArrangedSubview(self.sizeOptionView)
        
        self.sizeOptionView
            .leadingAnchor(self.leadingAnchor, padding: 5)
            .widthAnchor(self.widthAnchor, multiplier: 0.9)
    }
    
    private func configureIceQuantityOptionView() {
        self.addArrangedSubview(self.iceQuantityOptionView)
        
        self.iceQuantityOptionView
            .leadingAnchor(self.leadingAnchor, padding: 5)
            .widthAnchor(self.widthAnchor, multiplier: 0.9)
    }
}
