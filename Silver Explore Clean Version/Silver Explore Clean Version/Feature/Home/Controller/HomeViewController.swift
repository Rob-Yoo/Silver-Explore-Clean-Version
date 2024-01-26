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
    private let model = HomeModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buildViewHierachy()
        self.configureViewConstraints()
        self.addUserActionListener()

        self.model.addObserver(self)
    }
}

//MARK: - Responsibility of View Managing
extension HomeViewController: ViewManagerProtocol {
    func buildViewHierachy() {
        self.view.addSubview(self.backgroundImageView)
        self.view.addSubview(self.titleView)
        self.view.addSubview(self.buttonsView)
    }
    
    func configureViewConstraints() {
        self.addBackGroundImageViewConstraints()
        self.addTitleViewConstraints()
        self.addButtonsViewConstraints()
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

//MARK: - User Action Handling
extension HomeViewController {
    @objc private func touchGestureExploreBtnTapped() {
        self.model.selectedContent = .TouchGestureExplore
    }
    
    @objc private func kioskExploreBtnTapped() {
        self.model.selectedContent = .KioskExplore
    }

    @objc private func aiExploreBtnTapped() {
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
