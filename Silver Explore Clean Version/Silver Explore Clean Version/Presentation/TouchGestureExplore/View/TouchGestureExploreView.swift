//
//  TouchGestureExploreView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/8/24.
//

import UIKit

@objc protocol TouchGestureExploreViewDelegate: AnyObject {
    @objc func prevButtonTapped()
    @objc func nextButtonTapped()
}

final class TouchGestureExploreView: UIView {
    private(set) var exploreIndicatorStackView: BlurredExploreIndicatorStackView
    private(set) var exploreStageDescriptionView: BlurredExploreStageDescriptionView
    
    weak var touchGestureExploreViewDelegate: TouchGestureExploreViewDelegate?
    
    init(blurEffect: UIBlurEffect) {
        self.exploreIndicatorStackView = BlurredExploreIndicatorStackView(effect: blurEffect)
        self.exploreStageDescriptionView = BlurredExploreStageDescriptionView(effect: blurEffect)

        super.init(frame: .zero)
        self.configureSubViews()
//        self.addUserAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubViews() {
        self.configureExploreIndicatorStackView()
        self.configureExploreStageDescriptionView()
    }
    
    private func configureExploreIndicatorStackView() {
        self.addSubview(self.exploreIndicatorStackView)
        
        self.exploreIndicatorStackView
            .widthAnchor(self.widthAnchor, multiplier: 0.8)
            .heightAnchor(self.heightAnchor, multiplier: 0.05)
            .topAnchor(self.topAnchor, padding: 50)
            .centerXAnchor(self.centerXAnchor)
    }
 
    private func configureExploreStageDescriptionView() {
        self.addSubview(self.exploreStageDescriptionView)
        
        self.exploreStageDescriptionView.layer.cornerRadius = 30
        self.exploreStageDescriptionView.clipsToBounds = true
        self.exploreStageDescriptionView
            .widthAnchor(self.widthAnchor, multiplier: 0.7)
            .heightAnchor(self.heightAnchor, multiplier: 0.5)
            .centerXAnchor(self.centerXAnchor)
            .centerYAnchor(self.centerYAnchor)
        
        self.exploreStageDescriptionView.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(self.exploreStageDescriptionViewTapped))
        )
    }
}

// MARK: - User Action Handling
extension TouchGestureExploreView {
    @objc private func exploreStageDescriptionViewTapped() {
        self.exploreStageDescriptionView.isHidden = true
    }
}

// MARK: - Communicate with ViewController
extension TouchGestureExploreView {
    private func addUserAction() {
        guard let delegate = touchGestureExploreViewDelegate else {
            fatalError("TouchGestureExploreViewDelegate 지정 후 사용해주세요!")
        }
        
        self.exploreIndicatorStackView.prevButton.addTarget(delegate, action: #selector(delegate.prevButtonTapped), for: .touchUpInside)
        
        self.exploreIndicatorStackView.nextButton.addTarget(delegate, action: #selector(delegate.nextButtonTapped), for: .touchUpInside)
    }
    
    func update(_ title: String, _ image: UIImage, _ description: String) {
        self.exploreIndicatorStackView.update(title)
        self.exploreStageDescriptionView.update(image, description)
    }
}
