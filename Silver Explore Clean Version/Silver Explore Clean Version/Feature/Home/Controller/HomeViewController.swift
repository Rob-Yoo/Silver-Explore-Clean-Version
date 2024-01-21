//
//  ViewController.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/18/24.
//

import UIKit

class HomeViewController: UIViewController {
    let id = String(describing: HomeViewController.self)
    private let backgroundImageView = UIImageView(image: .mainBackground)
    private let titleView = TitleView()
    private let buttonsView = ButtonsView()
    private let exploreContent = ExploreContent() // Model

    override func viewDidLoad() {
        super.viewDidLoad()
        buildViewHierachy()
        applyConstraintsToView()
        addUserActionListener()

        exploreContent.addObserver(self)
    }
}

//MARK: - Responsibility of View Managing
extension HomeViewController: ViewManagerProtocol {
    func buildViewHierachy() {
        self.view.addSubview(self.backgroundImageView)
        self.view.addSubview(self.titleView)
        self.view.addSubview(self.buttonsView)
    }
    
    func applyConstraintsToView() {
        addBackGroundImageViewConstraints()
        addTitleViewConstraints()
        addButtonsViewConstraints()
    }
    
    func addUserActionListener() {
        self.buttonsView.touchGestureExploreBtn.addTarget(self, action: #selector(touchGestureExploreBtnTapped), for: .touchUpInside)

        self.buttonsView.kioskExploreBtn.addTarget(self, action: #selector(kioskExploreBtnTapped), for: .touchUpInside)

        self.buttonsView.aiExploreBtn.addTarget(self, action: #selector(aiExploreBtnTapped), for: .touchUpInside)
    }
    
    private func addBackGroundImageViewConstraints() {
        self.backgroundImageView
            .widthAnchor(self.view.widthAnchor)
            .heightAnchor(self.view.heightAnchor)
    }
    
    private func addTitleViewConstraints() {
        self.titleView
            .topAnchor(self.view.topAnchor, padding: 150)
            .widthAnchor(self.titleView.titleLabel.widthAnchor)
            .heightAnchor(self.view.heightAnchor, multiplier: 0.15)
            .centerXAnchor(self.view.centerXAnchor)
    }
    
    private func addButtonsViewConstraints() {
        let viewWidth = UIImage.touchGestureExplorer.size.width
        let viewHeight = UIImage.touchGestureExplorer.size.height * 3.5
        
        self.buttonsView
            .centerXAnchor(self.view.centerXAnchor)
            .centerYAnchor(self.view.centerYAnchor, constant: 100)
            .size(.init(width: viewWidth, height: viewHeight))
    }
}

//MARK: - Responsibility of Updating Model
extension HomeViewController {
    @objc private func touchGestureExploreBtnTapped() {
        self.exploreContent.selectedContent = .TouchGestureExplore
    }
    
    @objc private func kioskExploreBtnTapped() {
        self.exploreContent.selectedContent = .KioskExplore
    }

    @objc private func aiExploreBtnTapped() {
        self.exploreContent.selectedContent = .AIExplore
    }
}

//MARK: - Observer
extension HomeViewController: Observer {
    func update() {
        let contentOnboarding = ContentOnboardingViewController(selectedContent: self.exploreContent.selectedContent)

        NavigationManager.shared.push(contentOnboarding)
    }
}


//#if DEBUG
//import SwiftUI
//struct ViewControllerRepresentable: UIViewControllerRepresentable {
//    
//func updateUIViewController(_ uiView: UIViewController,context: Context) {
//        // leave this empty
//}
//@available(iOS 13.0.0, *)
//func makeUIViewController(context: Context) -> UIViewController{
//        HomeViewController()
//    }
//}
//@available(iOS 13.0, *)
//struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
//    static var previews: some View {
//        Group {
//            ViewControllerRepresentable()
//                .ignoresSafeArea()
//                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
//        }
//        
//    }
//} #endif
