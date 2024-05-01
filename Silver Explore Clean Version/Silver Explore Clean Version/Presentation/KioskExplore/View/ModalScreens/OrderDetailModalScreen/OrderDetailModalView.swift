//
//  OrderDetailModalView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 4/15/24.
//

import UIKit

@objc protocol OrderDetailModalViewDelegate: AnyObject {
    @objc func minusButtonTapped()
    @objc func plusButtonTapped()
    @objc func hotButtonTapped()
    @objc func iceButtonTapped()
    @objc func sizeOptionControlled(_ sender: UISegmentedControl)
    @objc func iceQuantityOptionControlled(_ sender: UISegmentedControl)
    @objc func cancelButtonTapped()
    @objc func addCartButtonTapped()
}

final class OrderDetailModalView: UIView {
    private(set) var bodyView: OrderDetailModalBodyView
    private(set) var separatorLineView = SeparatorLineView()
    private(set) var footerButtonsView = FooterButtonsView()
    
    weak var orderDetailModalViewDelegate: OrderDetailModalViewDelegate?
    
    init(product: ProductData) {
        self.bodyView = OrderDetailModalBodyView(product: product)
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        self.configureBodyView()
        self.configureSeparatorLineView()
        self.configureFooterButtonsView()
    }
    
    private func configureBodyView() {
        self.addSubview(self.bodyView)
        
        self.bodyView
            .topAnchor(self.topAnchor)
            .widthAnchor(self.widthAnchor)
            .heightAnchor(self.heightAnchor, multiplier: 0.85)
    }
    
    private func configureSeparatorLineView() {
        self.addSubview(self.separatorLineView)
        
        self.separatorLineView
            .topAnchor(self.bodyView.bottomAnchor)
            .widthAnchor(self.widthAnchor)
            .heightAnchor(equalToConstant: 3)
    }
    
    private func configureFooterButtonsView() {
        self.addSubview(self.footerButtonsView)
        
        self.footerButtonsView
            .topAnchor(self.separatorLineView.bottomAnchor, padding: 35)
            .bottomAnchor(self.bottomAnchor, padding: -35)
            .widthAnchor(self.widthAnchor, multiplier: 0.8)
            .centerXAnchor(self.centerXAnchor)
    }
    
    func update(data: ProductData) {
        self.bodyView.update(data: data)
    }
}

//MARK: - Communicate With Controller
extension OrderDetailModalView {
    func addUserAction() {
        guard let delegate = self.orderDetailModalViewDelegate else {
            fatalError("OrderDetailModalViewDelegate 지정 후 사용해주세요!")
        }
        
        NotificationCenter.default.post(name: .OrderDetailViewUserAction, object: delegate)
    }
}
