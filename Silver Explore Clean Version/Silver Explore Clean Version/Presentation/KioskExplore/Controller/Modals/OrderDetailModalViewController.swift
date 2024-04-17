//
//  OrderDetailModalViewController.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/2/24.
//

import UIKit

protocol OrderDetailModalDelegate: AnyObject {
    func addCart(product: Product)
}

class OrderDetailModalViewController: UIViewController {
    private var model: Product
    private let contentView: OrderDetailModalView

    weak var delegate: OrderDetailModalDelegate?
    
    override func loadView() {
        super.loadView()
        self.view = BaseModalView(title: "옵션 선택", contentView: self.contentView)
        
        self.contentView.orderDetailModalViewDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentView.addUserAction()
        self.observeModel()
    }
    
    init(selectedProduct: Product) {
        self.model = selectedProduct
        self.contentView = OrderDetailModalView(product: selectedProduct)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func updateView() {
        self.contentView.update(data: self.model)
    }
}

//MARK: - User Action Handling
extension OrderDetailModalViewController: OrderDetailModalViewDelegate {
    @objc func minusButtonTapped() {
        self.model.removeCount()
    }
    
    @objc func plusButtonTapped() {
        self.model.addCount()
    }
    
    @objc func hotButtonTapped() {
        self.model.changeTemperature(.hot)
    }
    
    @objc func iceButtonTapped() {
        self.model.changeTemperature(.ice)
    }
    
    @objc func sizeOptionControlled(_ sender: UISegmentedControl) {
        let segmentedIndex = sender.selectedSegmentIndex
        let size = Size(rawValue: segmentedIndex)!

        self.model.changeSize(size)
    }
    
    @objc func iceQuantityOptionControlled(_ sender: UISegmentedControl) {
        let segmentedIndex = sender.selectedSegmentIndex
        let iceQuantity = IceQuantity(rawValue: segmentedIndex)!

        self.model.changeIceQuantity(iceQuantity)
    }
    
    @objc func cancelButtonTapped() {
        self.dismiss(animated: false)
    }
    
    @objc func addCartButtonTapped() {
        guard let delegate = self.delegate else {
            fatalError("OrderDetailModalDelegate 지정 후 사용해주세요!")
        }
        
        delegate.addCart(product: self.model)
        self.dismiss(animated: false)
    }
}

//MARK: - Observing Model
extension OrderDetailModalViewController {
    private func observeModel() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateView), name: .OrderDetailChanged, object: nil)
    }
}

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable_POSVC: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
@available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        let itemInfo: ItemInfo = (name: "아메리카노", image: .americano, price: 4500, isIceOnly: false)
        let product = Product.createProduct(itemInfo: itemInfo)

        return OrderDetailModalViewController(selectedProduct: product)
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_POSVC_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable_POSVC()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
        }
        
    }
} #endif
