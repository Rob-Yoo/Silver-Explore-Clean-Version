//
//  ProductOptionSelectionViewController.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/2/24.
//

import UIKit

class ProductOptionSelectionViewController: UIViewController {
    private let modalView = ProductOptionSelectionModalView()
    
    override func loadView() {
        super.loadView()
        
        self.view = self.modalView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    ProductOptionSelectionViewController()
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
