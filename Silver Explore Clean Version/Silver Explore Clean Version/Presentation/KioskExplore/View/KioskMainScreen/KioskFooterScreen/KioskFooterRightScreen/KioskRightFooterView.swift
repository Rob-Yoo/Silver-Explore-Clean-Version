//
//  KioskLeftFooterView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/2/24.
//

import UIKit

final class KioskRightFooterView: UIView {
    private(set) var paymentButtonView = PaymentButtonView()
    private(set) var resetButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .silverLight
        button.setTitle("처음으로", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        self.configurePaymentButtonView()
        self.configureResetButton()
    }
    
    private func configurePaymentButtonView() {
        self.addSubview(self.paymentButtonView)
        
        self.paymentButtonView
            .topAnchor(self.topAnchor)
            .widthAnchor(self.widthAnchor)
            .heightAnchor(self.heightAnchor, multiplier: 0.7)
    }
    
    private func configureResetButton() {
        self.addSubview(self.resetButton)
        
        self.resetButton
            .topAnchor(self.paymentButtonView.bottomAnchor, padding: 10)
            .bottomAnchor(self.bottomAnchor)
            .widthAnchor(self.widthAnchor)
    }
}
