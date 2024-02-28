//
//  KioskViewController.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/23/24.
//

import UIKit

class KioskViewController: UIViewController {
    private let initialScreenView = InitialScreenView()

    override func loadView() {
        super.loadView()
        self.view = self.initialScreenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable_KVC: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController{
        KioskViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_KVC_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable_KVC()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
        }
        
    }
} #endif
