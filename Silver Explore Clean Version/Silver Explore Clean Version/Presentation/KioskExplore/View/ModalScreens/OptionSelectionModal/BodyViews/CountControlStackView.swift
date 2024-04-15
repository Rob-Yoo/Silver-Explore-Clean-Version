//
//  CountControlStackView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/2/24.
//

import UIKit

final class CountControlStackView: UIStackView {
    private let buttonSymbolFont = UIFont.systemFont(ofSize: 45, weight: .bold)
    
    private(set) lazy var minusButton = ImageButton.createSFSymbolButton(systemName: "minus.circle.fill", font: self.buttonSymbolFont, tintColor: .mainTheme)
    private(set) lazy var plusButton = ImageButton.createSFSymbolButton(systemName: "plus.circle.fill", font: self.buttonSymbolFont, tintColor: .mainTheme)
    private(set) var orderCountLabel: TextLabel
    
    private var arrangedViews: [UIView] {
        return [minusButton, orderCountLabel, plusButton]
    }
    
    init(product: Product) {
        self.orderCountLabel = TextLabel(text: "\(product.orderDetail.count)").font(.systemFont(ofSize: 45, weight: .semibold))
        super.init(frame: .zero)
        self.configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.axis = .horizontal
        self.alignment = .fill
        self.spacing = 10
        self.distribution = .fillEqually
        self.arrangedViews.forEach {
            self.addArrangedSubview($0)
        }
    }
    
    func update(orderCount: Int) {
        self.orderCountLabel.text = String(orderCount)
    }
}
