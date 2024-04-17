//
//  OrderCountAndPriceStackView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/2/24.
//

import UIKit

final class OrderCountAndPriceStackView: UIStackView {
    private(set) var emptyView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private(set) var countControlStackView: CountControlStackView
    private(set) var priceLabel: TextLabel
    
    private var arrangedViews: [UIView] {
        return [emptyView, countControlStackView, priceLabel]
    }
    
    init(count: Int = 1, price: Int) {
        self.countControlStackView = CountControlStackView(ofSize: 45, initCount: count)
        self.priceLabel = TextLabel(text: "W " + price.decimalFormattedString).font(.systemFont(ofSize: 45, weight: .bold))
        super.init(frame: .zero)
        self.configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    func update(count: Int, price: Int) {
        self.countControlStackView.update(count: count)
        self.priceLabel.text = "W " + price.decimalFormattedString
    }
}
