//
//  OrderStatusTableViewCell.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/2/24.
//

import UIKit

final class OrderStatusTableViewCell: UITableViewCell {
    private(set) var orderedItemNameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "아메리카노"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    private(set) var orderCountControlStackView = OrderCountControlStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        self.configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        self.configureOrderedItemNameLabel()
        self.configureOrderCountControlStackView()
    }
    
    private func configureOrderedItemNameLabel() {
        self.addSubview(self.orderedItemNameLabel)
        
        self.orderedItemNameLabel
            .leadingAnchor(self.leadingAnchor, padding: 10)
            .centerYAnchor(self.centerYAnchor)
    }
    
    private func configureOrderCountControlStackView() {
        self.addSubview(self.orderCountControlStackView)
        
        self.orderCountControlStackView
            .trailingAnchor(self.trailingAnchor, padding: -5)
            .centerYAnchor(self.centerYAnchor)
    }
}
