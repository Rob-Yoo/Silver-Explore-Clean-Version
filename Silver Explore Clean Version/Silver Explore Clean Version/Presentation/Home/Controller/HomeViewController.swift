//
//  ViewController.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/18/24.
//

import UIKit

class HomeViewController: UIViewController {
    let id = String(describing: HomeViewController.self)
    private let homeView = HomeView()
    private let model = HomeModel()

    override func loadView() {
        super.loadView()

        self.view = homeView
        self.homeView.homeViewDelegate = self
        self.homeView.addUserActionListener()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.model.addObserver(self)
    }
}

//MARK: - User Action Handling
extension HomeViewController: HomeViewDelegate {
    @objc func touchGestureExploreBtnTapped() {
        self.model.selectedContent = .TouchGestureExplore
    }
    
    @objc func kioskExploreBtnTapped() {
        self.model.selectedContent = .KioskExplore
    }

    @objc func aiExploreBtnTapped() {
        self.model.selectedContent = .AIExplore
    }
}

//MARK: - Observing Model
extension HomeViewController: Observer {
    func update() {
        if let exploreContentVC = ExploreContentFactory.createExploreContentVC(content: self.model.selectedContent) {
            NavigationManager.shared.push(exploreContentVC)
        }
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
