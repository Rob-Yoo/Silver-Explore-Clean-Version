//
//  ExploreStageDescriptionStackView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/16/24.
//

import UIKit

final class BlurredExploreStageDescriptionView: UIVisualEffectView {
    private(set) var exploreStageDescriptionStackView: ExploreStageDescriptionStackView
    
    init(effect: UIVisualEffect, gestureImage: UIImage, stageDescription: String) {
        self.exploreStageDescriptionStackView = ExploreStageDescriptionStackView(image: gestureImage, description: stageDescription)
        super.init(effect: effect)
        self.configure()
    }
    
    private func configure() {
        self.contentView.addSubview(self.exploreStageDescriptionStackView)
        
        self.exploreStageDescriptionStackView.widthAnchor(self.widthAnchor)
            .heightAnchor(self.heightAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ image: UIImage, _ description: String) {
        self.exploreStageDescriptionStackView.update(image, description)
    }
}
