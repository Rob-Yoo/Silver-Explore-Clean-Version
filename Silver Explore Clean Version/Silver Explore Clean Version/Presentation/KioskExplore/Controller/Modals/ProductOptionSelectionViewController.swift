//
//  ProductOptionSelectionViewController.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/2/24.
//

import UIKit
import Combine

protocol ProductOptionSelectionModalDelegate: AnyObject {
    func addCart(product: Product)
}

class ProductOptionSelectionViewController: UIViewController {
    private var model: Product
    private let modalView: BaseModalView
    private let contentView: OrderDetailModalView
    private var cancellables = Set<AnyCancellable>()

    weak var delegate: ProductOptionSelectionModalDelegate?
    
    override func loadView() {
        super.loadView()
        self.view = self.modalView
        
//        self.modalView.delegate = self
//        self.modalView.addUserAction()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.observeModel()
    }
    
    init(selectedProduct: Product) {
        self.model = selectedProduct
        self.contentView = OrderDetailModalView(product: selectedProduct)
        self.modalView = BaseModalView(title: "옵션 선택", contentView: self.contentView)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - User Action Handling
extension ProductOptionSelectionViewController: OrderDetailModalViewDelegate {
    @objc func minusButtonTapped() {
        self.model.orderDetail.removeCount()
    }
    
    @objc func plusButtonTapped() {
        self.model.orderDetail.addCount()
    }
    
    @objc func hotButtonTapped() {
        self.model.orderDetail.changeTemperature(.hot)
    }
    
    @objc func iceButtonTapped() {
        self.model.orderDetail.changeTemperature(.ice)
    }
    
    @objc func sizeOptionControlled(_ sender: UISegmentedControl) {
        let segmentedIndex = sender.selectedSegmentIndex
        let size = Size(rawValue: segmentedIndex)!

        self.model.orderDetail.changeSize(size)
    }
    
    @objc func iceQuantityOptionControlled(_ sender: UISegmentedControl) {
        let segmentedIndex = sender.selectedSegmentIndex
        let iceQuantity = IceQuantity(rawValue: segmentedIndex)!

        self.model.orderDetail.changeIceQuantity(iceQuantity)
    }
    
    @objc func cancelButtonTapped() {
        self.dismiss(animated: false)
    }
    
    @objc func addCartButtonTapped() {
        guard let delegate = self.delegate else {
            fatalError("ProductOptionSelectionModalDelegate 지정 후 사용해주세요!")
        }
        
        delegate.addCart(product: self.model)
        print(self.model.orderDetail.totalPrice, self.model.orderDetail.temperature)
        self.dismiss(animated: false)
    }
}

//MARK: - Observing Model
extension ProductOptionSelectionViewController {
//    private func observeModel() {
//        self.model.orderDetail.$count
//            .sink { [weak self] newValue in
//                self?.modalView.optionSelectionModalView.bodyView
//                    .productCountControlStackView.rightView.countControlStackView.update(orderCount: newValue)
//            }
//            .store(in: &cancellables)
//        
//        self.model.orderDetail.$temperature
//            .sink { [weak self] newValue in
//                self?.modalView.optionSelectionModalView.bodyView.optionSelectionView.temperatureOptionView.update()
//            }
//            .store(in: &cancellables)
//    }
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

        return ProductOptionSelectionViewController(selectedProduct: product)
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
