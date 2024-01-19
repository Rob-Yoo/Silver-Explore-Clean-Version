//
//  ViewController.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/18/24.
//

import UIKit

class HomeViewController: UIViewController {
    let backgroundImageView = UIImageView(image: .mainBackground)
    let titleView = TitleView()
    let buttonsView = ButtonsView()
    private var selectedContent: Content = .none

    override func viewDidLoad() {
        super.viewDidLoad()
        buildViewHierachy()
        applyConstraintsToView()
        addUserActionHandler()
    }
}

//MARK: - User Action Controller
extension HomeViewController: UserActionHandler {
    func addUserActionHandler() {
        self.buttonsView.touchGestureExploreBtn.addTarget(self, action: #selector(touchGestureExploreBtnTapped), for: .touchUpInside)
        self.buttonsView.kioskExploreBtn.addTarget(self, action: #selector(kioskExploreBtnTapped), for: .touchUpInside)
        self.buttonsView.aiExploreBtn.addTarget(self, action: #selector(aiExploreBtnTapped), for: .touchUpInside)
    }
    
    @objc private func touchGestureExploreBtnTapped() {
        self.selectedContent = .TouchGestureExplore
    }
    
    @objc private func kioskExploreBtnTapped() {
        self.selectedContent = .KioskExplore
    }

    @objc private func aiExploreBtnTapped() {
        self.selectedContent = .AIExplore
    }
}


#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController{
        HomeViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
        }
        
    }
} #endif
