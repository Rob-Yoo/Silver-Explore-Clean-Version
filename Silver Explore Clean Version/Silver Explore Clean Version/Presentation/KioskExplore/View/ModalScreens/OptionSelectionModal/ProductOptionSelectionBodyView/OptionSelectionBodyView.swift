//
//  OptionSelectionBodyView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/2/24.
//

import UIKit

final class OptionSelectionBodyView: UIView {
    private let product = Product(name: "아메리카노", image: .americano, price: 4500, option: .init(temperature: .iceOnly))

    private(set) lazy var productNameLabel = {
        let label = UILabel()
        
        label.text = self.product.name
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    private(set) var productCountControlStackView = ProductCountControlStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        self.configureProductNameLabel()
        self.configureProductCountControlStackView()
    }
    
    private func configureProductNameLabel() {
        self.addSubview(self.productNameLabel)
        
        self.productNameLabel
            .topAnchor(self.topAnchor, padding: 30)
            .centerXAnchor(self.centerXAnchor)
    }
    
    private func configureProductCountControlStackView() {
        self.addSubview(self.productCountControlStackView)
        
        self.productCountControlStackView
            .topAnchor(self.productNameLabel.bottomAnchor, padding: 50)
            .widthAnchor(self.widthAnchor, multiplier: 0.6)
            .heightAnchor(self.heightAnchor, multiplier: 0.3)
            .centerXAnchor(self.centerXAnchor)
    }
}

