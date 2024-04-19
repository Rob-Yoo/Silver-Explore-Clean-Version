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
        
        self.addUserActionToCountControlView(delegate: delegate)
        self.addUserActionToTemperatureOptionView(delegate: delegate)
        self.addUserActionToOptionSelectionView(delegate: delegate)
        self.addUserActionToFooterButtonsView(delegate: delegate)
    }
    
    private func addUserActionToCountControlView(delegate: OrderDetailModalViewDelegate) {
        let targetView = self.bodyView.productDetailStackView.rightView.countControlStackView
        let minusButton = targetView.minusButton
        let plusButton = targetView.plusButton
        
        minusButton.addTarget(delegate, action: #selector(delegate.minusButtonTapped), for: .touchUpInside)
        plusButton.addTarget(delegate, action: #selector(delegate.plusButtonTapped), for: .touchUpInside)
    }
    
    private func addUserActionToTemperatureOptionView(delegate: OrderDetailModalViewDelegate) {
        let targetView = self.bodyView.optionSelectionView.temperatureOptionView
        let hotButton = targetView.hotButton
        let iceButton = targetView.iceButton
        
        hotButton.addTarget(delegate, action: #selector(delegate.hotButtonTapped), for: .touchUpInside)
        iceButton.addTarget(delegate, action: #selector(delegate.iceButtonTapped), for: .touchUpInside)
    }
    
    private func addUserActionToOptionSelectionView(delegate: OrderDetailModalViewDelegate) {
        let targetView = self.bodyView.optionSelectionView
        let sizeOptionSegmentedControl = targetView.sizeOptionSegmentedControl
        let iceQuantityOptionSegmentedControl = targetView.iceQuantityOptionSegmentedControl

        sizeOptionSegmentedControl.addTarget(delegate, action: #selector(delegate.sizeOptionControlled(_:)), for: .valueChanged)
        iceQuantityOptionSegmentedControl.addTarget(delegate, action: #selector(delegate.iceQuantityOptionControlled(_:)), for: .valueChanged)
    }
    
    private func addUserActionToFooterButtonsView(delegate: OrderDetailModalViewDelegate) {
        let targetView = self.footerButtonsView
        let cancelButton = targetView.cancelButton
        let addCartButton = targetView.addCartButton
        
        cancelButton.addTarget(delegate, action: #selector(delegate.cancelButtonTapped), for: .touchUpInside)
        addCartButton.addTarget(delegate, action: #selector(delegate.addCartButtonTapped), for: .touchUpInside)
    }
}
