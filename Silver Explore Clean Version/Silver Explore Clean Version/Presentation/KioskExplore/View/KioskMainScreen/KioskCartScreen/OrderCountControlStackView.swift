//
//  OrderCountControlStackView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/1/24.
//

import UIKit

final class OrderCountControlStackView: UIStackView {
    private(set) var minusButton = ImageButton(image: .init(systemName: "minus.circle.fill")!)
    private(set) var orderCountLabel: UILabel = {
        let label = UILabel()
        
        label.text = "1"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    private(set) var plusButton = ImageButton(image: .init(systemName: "plus.circle.fill")!)
    private(set) var deleteButton = ImageButton(image: .init(systemName: "xmark.app.fill")!)

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
        self.distribution = .fillEqually
        self.arrangedViews.forEach {
            self.addArrangedSubview($0)
        }
    }
}
