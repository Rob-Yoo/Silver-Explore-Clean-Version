//
//  PaymentButtonView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/2/24.
//

import UIKit

//TODO: - GestureRecognizer 달기

final class PaymentButtonView: UIView {
    private(set) var priceLabel: UILabel = {
        let label = UILabel()
        
        label.text = "₩ 0"
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.textColor = .red
        label.textAlignment = .center
        return label
    }()
    private(set) var paymentLabel: UILabel = {
        let label = UILabel()
        
        label.text = "결제하기"
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .blue
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.configurePriceLabel()
        self.configurePaymentLabel()
    }
    
    private func configurePriceLabel() {
        self.addSubview(self.priceLabel)
        
        self.priceLabel
            .centerXAnchor(self.centerXAnchor)
            .centerYAnchor(self.centerYAnchor, constant: -20)
    }
    
    private func configurePaymentLabel() {
        self.addSubview(self.paymentLabel)
        
        self.paymentLabel
            .topAnchor(self.priceLabel.bottomAnchor, padding: 10)
            .centerXAnchor(self.centerXAnchor)
    }
}
