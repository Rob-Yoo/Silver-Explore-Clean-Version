//
//  KioskMainViewController.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/29/24.
//

import UIKit

class KioskMainViewController: UIViewController {
    private let kioskMainView = KioskMainView()

    override func loadView() {
        super.loadView()
        
        self.view = kioskMainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

