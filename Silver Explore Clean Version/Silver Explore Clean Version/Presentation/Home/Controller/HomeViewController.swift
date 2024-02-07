//
//  ViewController.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/18/24.
//

import UIKit

class HomeViewController: UIViewController {
    private let homeView = HomeView()

    override func loadView() {
        super.loadView()

        self.view = homeView
        self.homeView.homeViewDelegate = self
        self.homeView.addUserActionListener()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - User Action Handling
extension HomeViewController: HomeViewDelegate {
    @objc func touchGestureExploreBtnTapped() {
        NavigationManager.shared.push(ARCharacterSelectionViewController())
    }
    
    @objc func kioskExploreBtnTapped() {
        NavigationManager.shared.push(KioskViewController())
    }

    @objc func aiExploreBtnTapped() {
        NavigationManager.shared.push(AIExploreViewController())
    }
}


#if DEBUG
import SwiftUI
struct ViewControllerRepresentable_HVC: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController{
        HomeViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_HVC_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable_HVC()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
        }
        
    }
} #endif
