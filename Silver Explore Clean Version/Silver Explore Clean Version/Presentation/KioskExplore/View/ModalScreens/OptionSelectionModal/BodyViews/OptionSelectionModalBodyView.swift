//
//  OptionSelectionBodyView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/2/24.
//

import UIKit

final class OptionSelectionModalBodyView: UIView {
    private(set) var productNameLabel: TextLabel
    private(set) var productCountControlStackView: ProductCountControlStackView
    private(set) var optionSelectionView: OptionSelectionView
    
    init(product: Product) {
        self.productNameLabel = TextLabel(text: product.name).font(.systemFont(ofSize: 40, weight: .bold))
        self.productCountControlStackView = ProductCountControlStackView(product: product)
        self.optionSelectionView = OptionSelectionView(product: product)
        super.init(frame: .zero)

        self.configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        self.configureProductNameLabel()
        self.configureProductCountControlStackView()
        self.configureOptionSelectionView()
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
            .widthAnchor(self.widthAnchor, multiplier: 0.7)
            .heightAnchor(self.heightAnchor, multiplier: 0.3)
            .centerXAnchor(self.centerXAnchor)
    }
    
    private func configureOptionSelectionView() {
        self.addSubview(self.optionSelectionView)
        
        self.optionSelectionView
            .topAnchor(self.productCountControlStackView.bottomAnchor, padding: 50)
            .bottomAnchor(self.bottomAnchor, padding: -20)
            .widthAnchor(self.productCountControlStackView.widthAnchor)
            .centerXAnchor(self.centerXAnchor)
    }
}

