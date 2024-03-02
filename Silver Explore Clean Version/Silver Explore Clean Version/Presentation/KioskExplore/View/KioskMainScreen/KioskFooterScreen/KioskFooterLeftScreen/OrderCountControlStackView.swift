//
//  OrderCountControlStackView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/1/24.
//

import UIKit

final class OrderCountControlStackView: UIStackView {
    private let buttonSymbolFont = UIFont.systemFont(ofSize: 25, weight: .bold)

    private(set) lazy var minusButton = ImageButton.createSFSymbolButton(systemName: "minus.circle.fill", font: self.buttonSymbolFont, tintColor: .silverLight)
    private(set) lazy var plusButton = ImageButton.createSFSymbolButton(systemName: "plus.circle.fill", font: self.buttonSymbolFont, tintColor: .silverLight)
    private(set) lazy var deleteButton = ImageButton.createSFSymbolButton(systemName: "xmark.app.fill", font: self.buttonSymbolFont, tintColor: .red)

    private(set) var orderCountLabel: UILabel = {
        let label = UILabel()
        
        label.text = "1"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()

    private var arrangedViews: [UIView] {
        return [minusButton, orderCountLabel, plusButton, deleteButton]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
}
