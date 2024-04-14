//
//  ProductCountControlStackView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/2/24.
//

import UIKit

final class ProductCountControlStackView: UIStackView {
    private(set) var leftView: UIImageView
    private(set) var rightView: ProductCountControlRightStackView
    private var arrangedViews: [UIView] {
        return [leftView, rightView]
    }
    
    init(product: Product) {
        self.leftView = UIImageView(image: product.image)
        self.rightView = ProductCountControlRightStackView(product: product)
        super.init(frame: .zero)
        self.configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fillEqually
        self.spacing = 30
        self.arrangedViews.forEach {
            self.addArrangedSubview($0)
        }
    }
}

final class ProductCountControlRightStackView: UIStackView {
    private(set) var emptyView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private(set) var countControlStackView = CountControlStackView()
    
    private(set) lazy var priceLabel = {
        let label = UILabel()

        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private var arrangedViews: [UIView] {
        return [emptyView, countControlStackView, priceLabel]
    }
    
    init(product: Product) {
        super.init(frame: .zero)
        self.setUpPriceLabel(totalPrice: product.detail.totalPrice)
        self.configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpPriceLabel(totalPrice: Int) {
        let formattedPrice: String
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        formattedPrice = numberFormatter.string(from: NSNumber(value: totalPrice))!
        
        self.priceLabel.text = "₩ \(formattedPrice)"
    }
    
    private func configure() {
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fillEqually
        self.spacing = 30
        self.arrangedViews.forEach {
            self.addArrangedSubview($0)
        }
    }
}
