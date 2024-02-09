//
//  TouchGestureExploreView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/8/24.
//

import UIKit

final class TouchGestureExploreView: UIView {
    private(set) var exploreIndicatorStackView: BlurredExploreIndicatorStackView
    private(set) var exploreStageDescriptionView: UIVisualEffectView
    
    init(blurEffect: UIBlurEffect) {
        self.exploreIndicatorStackView = BlurredExploreIndicatorStackView(blurEffect: blurEffect)
        self.exploreStageDescriptionView = UIVisualEffectView(effect: blurEffect)
        
        super.init(frame: .zero)
        self.configureSubViews()
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
            .widthAnchor(self.widthAnchor, multiplier: 0.8)
            .heightAnchor(self.heightAnchor, multiplier: 0.6)
            .centerXAnchor(self.centerXAnchor)
            .centerYAnchor(self.centerYAnchor)
    }
}

final class BlurredExploreIndicatorStackView: UIStackView {
    private(set) var prevButton: BlurredButton
    private(set) var nextButton: BlurredButton
    private(set) var exploreStageTitleView: BlurredExploreStageTitleView
    private var indicatorViews: [UIView] {
        return [self.prevButton, self.exploreStageTitleView, self.nextButton]
    }
    
    init(blurEffect: UIBlurEffect) {
        self.prevButton = BlurredButton.makePrevButton(blurEffect: blurEffect)
        self.nextButton = BlurredButton.makeNextButton(blurEffect: blurEffect)
        self.exploreStageTitleView = BlurredExploreStageTitleView(effect: blurEffect)
        super.init(frame: .zero)
        self.configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fillProportionally
        self.spacing = 60
        self.indicatorViews.forEach {
            self.addArrangedSubview($0)
        }
        
        self.configurePrevButton()
        self.configureNextButton()
        self.configureExploreStageTitleView()
    }
    
    private func configurePrevButton() {
        self.prevButton.layer.cornerRadius = 10
        self.prevButton.clipsToBounds = true
        self.prevButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)

        self.prevButton
            .size(.init(width: 100, height: self.frame.height))
    }
    
    private func configureNextButton() {
        self.nextButton.layer.cornerRadius = 10
        self.nextButton.clipsToBounds = true
        self.nextButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        self.nextButton
            .size(.init(width: 100, height: self.frame.height))
    }
    
    private func configureExploreStageTitleView() {
        self.exploreStageTitleView.layer.cornerRadius = 10
        self.exploreStageTitleView.clipsToBounds = true
        self.exploreStageTitleView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        self.exploreStageTitleView
            .size(.init(width: 200, height: self.frame.height))
    }
}

final class BlurredExploreStageTitleView: UIVisualEffectView {
    private(set) var stageTitleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "탭하기 - 짧게"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        return label
    }()
    
    override init(effect: UIVisualEffect?) {
        super.init(effect: effect)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.contentView.addSubview(self.stageTitleLabel)
        
        self.stageTitleLabel
            .centerXAnchor(self.centerXAnchor)
            .centerYAnchor(self.centerYAnchor)
    }
}
