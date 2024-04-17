//
//  KioskMainViewController.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/29/24.
//

import UIKit

//TODO: - 각 모달들의 Delegate 프로토콜을 합성
protocol KioskModalDelegate: OrderDetailModalDelegate {
}

class KioskMainViewController: UIViewController {
    private let kioskMainView = KioskMainView()

    override func loadView() {
        super.loadView()
        
        self.view = kioskMainView
        self.kioskMainView.menuBoardView.kioskMainViewDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - User Action Handling
extension KioskMainViewController: KioskMenuBoardViewDelegate {
    func displayOrderDetailModal(itemInfo: ItemInfo) {
        let product = Product.createProduct(itemInfo: itemInfo)
        let modalVC = OrderDetailModalViewController(selectedProduct: product)

        modalVC.delegate = self
        NavigationManager.shared.presentModal(modalVC)
    }
    
}

//MARK: - KioskModalDelegate Implementation
extension KioskMainViewController: KioskModalDelegate {
    func addCart(product: Product) {
        print(product.name, product.totalPrice, product.count)
    }
}

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable_KMVC: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController{
        KioskMainViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_KMVC_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable_KMVC()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
        }
        
    }
} #endif

