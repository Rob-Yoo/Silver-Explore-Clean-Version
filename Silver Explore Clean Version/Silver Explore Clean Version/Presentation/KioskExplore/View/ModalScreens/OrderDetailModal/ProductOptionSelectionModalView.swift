//
//  ProductOptionSelectionModalView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/2/24.
//

import UIKit

@objc protocol ProductOptionSelectionModalViewDelegate: AnyObject {
    @objc func minusButtonTapped()
    @objc func plusButtonTapped()
    @objc func hotButtonTapped()
    @objc func iceButtonTapped()
    @objc func sizeOptionControlled(_ sender: UISegmentedControl)
    @objc func iceQuantityOptionControlled(_ sender: UISegmentedControl)
    @objc func cancelButtonTapped()
    @objc func addCartButtonTapped()
}

//final class ProductOptionSelectionModalView: UIView {
//    private(set) var optionSelectionModalView: OptionSelectionModalView
//    
//    weak var delegate: ProductOptionSelectionModalViewDelegate?
//    
//    init(product: Product) {
//        self.optionSelectionModalView = OptionSelectionModalView(product: product)
//        super.init(frame: .zero)
//        self.configure()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func configure() {
//        self.backgroundColor = .init(white: 0, alpha: 0.5)
//        self.addSubview(self.optionSelectionModalView)
//        
//        self.optionSelectionModalView
//            .widthAnchor(self.widthAnchor, multiplier: 0.8)
//            .heightAnchor(self.heightAnchor, multiplier: 0.8)
//            .centerXAnchor(self.centerXAnchor)
//            .centerYAnchor(self.centerYAnchor)
//    }
//}
//
//// MARK: - Communicate With Controller
//extension ProductOptionSelectionModalView {
//    func addUserAction() {
//        guard let delegate = self.delegate else {
//            fatalError("ProductOptionSelectionModalViewDelegate 지정 후 사용해주세요!")
//        }
//        
//        let bodyView = self.optionSelectionModalView.bodyView
//        let countControlView = bodyView.productCountControlStackView.rightView.countControlStackView
//        let temperatureOptionView = bodyView.optionSelectionView.temperatureOptionView
//        let sizeOptionSegmentedControl = bodyView.optionSelectionView.sizeOptionSegmentedControl
//        let iceQuantityOptionSegmentedControl = bodyView.optionSelectionView.iceQuantityOptionSegmentedControl
//        let footerButtonsView = self.optionSelectionModalView.footerButtonsView
//        
//        countControlView.minusButton.addTarget(delegate, action: #selector(delegate.minusButtonTapped), for: .touchUpInside)
//        
//        countControlView.plusButton.addTarget(delegate, action: #selector(delegate.plusButtonTapped), for: .touchUpInside)
//        
//        temperatureOptionView.hotButton.addTarget(delegate, action: #selector(delegate.hotButtonTapped), for: .touchUpInside)
//        
//        temperatureOptionView.iceButton.addTarget(delegate, action: #selector(delegate.iceButtonTapped), for: .touchUpInside)
//        
//        sizeOptionSegmentedControl.addTarget(delegate, action: #selector(delegate.sizeOptionControlled(_:)), for: .valueChanged)
//        
//        iceQuantityOptionSegmentedControl.addTarget(delegate, action: #selector(delegate.iceQuantityOptionControlled(_:)), for: .valueChanged)
//        
//        footerButtonsView.cancelButton.addTarget(delegate, action: #selector(delegate.cancelButtonTapped), for: .touchUpInside)
//        
//        footerButtonsView.addCartButton.addTarget(delegate, action: #selector(delegate.addCartButtonTapped), for: .touchUpInside)
//        
//    }
//    
////    func update(product: Product) {
////        self.optionSelectionModalView.bodyView.productCountControlStackView.rightView.countControlStackView.update(product: product)
////        
////        self.optionSelectionModalView.bodyView.optionSelectionView.temperatureOptionView.update()
////    }
//}

