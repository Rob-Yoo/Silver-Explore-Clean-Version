//
//  TouchGestureExploreView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/8/24.
//

import UIKit

final class TouchGestureExploreView: UIView {
    private(set) var exploreIndicatorStackView: BlurredExploreIndicatorStackView
    private(set) var exploreStageDescriptionView: BlurredExploreStageDescriptionView
    
    init(blurEffect: UIBlurEffect, firstStage: StageData) {
        self.exploreIndicatorStackView = BlurredExploreIndicatorStackView(effect: blurEffect, stageTitle: firstStage.title)
        self.exploreStageDescriptionView = BlurredExploreStageDescriptionView(effect: blurEffect, gestureImage: firstStage.image, stageDescription: firstStage.description)

        super.init(frame: .zero)
        self.configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
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
    
    func update(exploreStage: StageData) {
        self.updateGestureRecognizer(exploreStage)
        
        self.exploreIndicatorStackView.update(exploreStage.title)
        self.exploreStageDescriptionView.isHidden = false
        self.exploreStageDescriptionView.update(exploreStage.image, exploreStage.description)
    }
    
    private func updateGestureRecognizer(_ exploreStage: StageData) {
        let currentGestureRecognizers = self.gestureRecognizers ?? [UIGestureRecognizer]()
        
        currentGestureRecognizers.forEach { self.removeGestureRecognizer($0) }
        exploreStage.gestureRecognizers.forEach { self.addGestureRecognizer($0) }
    }
}

// MARK: - User Action Handling
extension TouchGestureExploreView {
    @objc private func exploreStageDescriptionViewTapped() {
        self.exploreStageDescriptionView.isHidden = true
    }
}
