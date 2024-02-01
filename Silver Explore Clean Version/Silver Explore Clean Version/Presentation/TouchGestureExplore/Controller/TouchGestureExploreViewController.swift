//
//  TouchGestureExploreViewController.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/23/24.
//

import UIKit

class TouchGestureExploreViewController: UIViewController {
    private let backgroundImageView = UIImageView(image: .mainBackground)
    private let titleLabelView = TitleLabelView(title: "AR 캐릭터 선택하기")
    private let prevButtonView = PrevButtonView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buildViewHierachy()
        self.configureViewConstraints()
        self.addUserActionListener()
    }
}

//MARK: - Responsibility of View Managing
extension TouchGestureExploreViewController {
    func buildViewHierachy() {
        self.view.addSubview(backgroundImageView)
        self.view.addSubview(titleLabelView)
        self.view.addSubview(prevButtonView)
    }
    
    func configureViewConstraints() {
        self.addBackgroundImageViewConstraints()
        self.addTitleLabelViewConstraints()
        self.addPrevButtonViewConstraints()
    }
    
    private func addBackgroundImageViewConstraints() {
        self.backgroundImageView
            .widthAnchor(self.view.widthAnchor)
            .heightAnchor(self.view.heightAnchor)
    }
    
    private func addTitleLabelViewConstraints() {
        self.titleLabelView
            .topAnchor(self.view.topAnchor, padding: 150)
            .widthAnchor(self.titleLabelView.titleLabel.widthAnchor)
            .heightAnchor(self.view.heightAnchor, multiplier: 0.15)
            .centerXAnchor(self.view.centerXAnchor)
    }
    
    private func addPrevButtonViewConstraints() {
        self.prevButtonView
            .topAnchor(self.view.safeAreaLayoutGuide.topAnchor, padding: 20)
            .leadingAnchor(self.view.leadingAnchor, padding: 20)
    }
}

//MARK: - User Action Handling
extension TouchGestureExploreViewController {
    func addUserActionListener() {
        self.prevButtonView.prevButton.addTarget(self, action: #selector(prevButtonTapped), for: .touchUpInside)
    }
    
    @objc private func prevButtonTapped() {
        NavigationManager.shared.pop()
    }
}

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable_TGEVC: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController{
        TouchGestureExploreViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_TGEVC_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable_TGEVC()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
        }
        
    }
} #endif

