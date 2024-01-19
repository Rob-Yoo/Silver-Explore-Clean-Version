//
//  ViewController.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/18/24.
//

import UIKit

class HomeViewController: UIViewController {
    private lazy var backgroundImageView: UIImageView = {
        let bgImageView = UIImageView(image: .mainBackground)
        
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        return bgImageView
    }()
    private lazy var titleView = TitleView()
    private var buttonsView = ButtonsView()
    private var selectedContent: Content = .none

    override func viewDidLoad() {
        super.viewDidLoad()
        buildViewHierachy()
        applyConstraintsToView()
        addEventHandler()
    }
}

//MARK: - Compose Subviews Controller
extension HomeViewController: Presentable {
    func buildViewHierachy() {
        self.view.addSubview(backgroundImageView)
        self.view.addSubview(titleView)
        self.view.addSubview(buttonsView)
    }
    
    func applyConstraintsToView() {
        addBackgroundImageViewConstraints()
        addTitleViewConstraints()
        addButtonsViewConstraints()
    }
    
    private func addBackgroundImageViewConstraints() {
        let constraints = [
            self.backgroundImageView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            self.backgroundImageView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addTitleViewConstraints() {
        let constraints = [
            self.titleView.widthAnchor.constraint(equalTo: self.titleView.titleLabel.widthAnchor),
            self.titleView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.15),
            self.titleView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.titleView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150)
        ]
        
        self.titleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addButtonsViewConstraints() {
        let constraints = [
            self.buttonsView.widthAnchor.constraint(equalToConstant: UIImage.touchGestureExplorer.size.width),
            self.buttonsView.heightAnchor.constraint(equalToConstant: UIImage.touchGestureExplorer.size.height * 4),
            self.buttonsView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.buttonsView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.height * 0.1)
        ]
        
        self.buttonsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
}

//MARK: - User Event Controller
extension HomeViewController: EventHandler {
    func addEventHandler() {
        self.buttonsView.touchGestureExploreBtn.addTarget(self, action: #selector(touchGestureExploreBtnTapped), for: .primaryActionTriggered)
        self.buttonsView.kioskExploreBtn.addTarget(self, action: #selector(kioskExploreBtnTapped), for: .touchUpInside)
        self.buttonsView.aiExploreBtn.addTarget(self, action: #selector(aiExploreBtnTapped), for: .touchUpInside)
    }
    
    @objc func touchGestureExploreBtnTapped() {
        self.selectedContent = .TouchGestureExplore
        print("1")
    }
    
    @objc private func kioskExploreBtnTapped() {
        self.selectedContent = .KioskExplore
        print("2")
    }

    @objc private func aiExploreBtnTapped() {
        self.selectedContent = .AIExplore
        print("3")
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
