//
//  ProuctDetailStackView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 4/16/24.
//

import UIKit

final class ProductDetailStackView: UIStackView {
    private(set) var leftView: UIImageView
    private(set) var rightView: OrderCountAndPriceStackView
    private var arrangedViews: [UIView] {
        return [leftView, rightView]
    }
    
    init(image: UIImage, price: Int) {
        self.leftView = UIImageView(image: image)
        self.rightView = OrderCountAndPriceStackView(price: price)
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
    
    func update(count: Int, price: Int) {
        self.rightView.update(count: count, price: price)
    }
}
