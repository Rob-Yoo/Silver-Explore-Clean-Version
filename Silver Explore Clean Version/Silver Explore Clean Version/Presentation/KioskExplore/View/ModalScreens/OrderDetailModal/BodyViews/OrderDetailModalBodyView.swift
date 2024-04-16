//
//  OptionSelectionBodyView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/2/24.
//

import UIKit

final class OrderDetailModalBodyView: UIView {
    private(set) var productNameLabel: TextLabel
    private(set) var productDetailStackView: ProductDetailStackView
    private(set) var optionSelectionView: OptionSelectionView
    
    init(product: Product) {
        self.productNameLabel = TextLabel(text: product.name).font(.systemFont(ofSize: 40, weight: .bold))
        self.productDetailStackView = ProductDetailStackView(image: product.image, price: product.orderDetail.totalPrice)
        self.optionSelectionView = OptionSelectionView(product: product)
        super.init(frame: .zero)

        self.configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        self.configureProductNameLabel()
        self.configureProductDetailStackView()
        self.configureOptionSelectionView()
    }
    
    private func configureProductNameLabel() {
        self.addSubview(self.productNameLabel)
        
        self.productNameLabel
            .topAnchor(self.topAnchor, padding: 30)
            .centerXAnchor(self.centerXAnchor)
    }
    
    private func configureProductDetailStackView() {
        self.addSubview(self.productDetailStackView)
        
        self.productDetailStackView
            .topAnchor(self.productNameLabel.bottomAnchor, padding: 50)
            .widthAnchor(self.widthAnchor, multiplier: 0.7)
            .heightAnchor(self.heightAnchor, multiplier: 0.3)
            .centerXAnchor(self.centerXAnchor)
    }
    
    private func configureOptionSelectionView() {
        self.addSubview(self.optionSelectionView)
        
        self.optionSelectionView
            .topAnchor(self.productDetailStackView.bottomAnchor, padding: 50)
            .bottomAnchor(self.bottomAnchor, padding: -20)
            .widthAnchor(self.productDetailStackView.widthAnchor)
            .centerXAnchor(self.centerXAnchor)
    }
}

