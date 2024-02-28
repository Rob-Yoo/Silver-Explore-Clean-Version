//
//  KioskViewController.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/23/24.
//

import UIKit

final class KioskInitialScreenViewController: UIViewController {
    private let initialScreenView = KioskInitialScreenView()

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
struct ViewControllerRepresentable_KIVC: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController{
        KioskInitialScreenViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_KIVC_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable_KIVC()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
        }
        
    }
} #endif
