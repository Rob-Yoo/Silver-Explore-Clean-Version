//
//  BlurredExploreIndicatorStackView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/16/24.
//

import UIKit

final class BlurredExploreIndicatorStackView: UIStackView {
    private(set) var prevButton: BlurredButton
    private(set) var nextButton: BlurredButton
    private(set) var exploreStageTitleView: BlurredExploreStageTitleView
    private var indicatorViews: [UIView] {
        return [self.prevButton, self.exploreStageTitleView, self.nextButton]
    }
    
    init(effect: UIBlurEffect) {
        self.prevButton = BlurredButton.makePrevButton(blurEffect: effect)
        self.nextButton = BlurredButton.makeNextButton(blurEffect: effect)
        self.exploreStageTitleView = BlurredExploreStageTitleView(effect: effect)
        super.init(frame: .zero)
        self.configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fill
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

        self.prevButton
            .size(.init(width: 100, height: self.frame.height))
    }
    
    private func configureNextButton() {
        self.nextButton.layer.cornerRadius = 10
        self.nextButton.clipsToBounds = true
        
        self.nextButton
            .size(.init(width: 100, height: self.frame.height))
    }
    
    private func configureExploreStageTitleView() {
        self.exploreStageTitleView.layer.cornerRadius = 10
        self.exploreStageTitleView.clipsToBounds = true
    }
    
    func update(_ title: String) {
        self.exploreStageTitleView.update(title)
    }
}

final class BlurredExploreStageTitleView: UIVisualEffectView {
    private(set) var stageTitleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "탭(터치하기)"
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
    
    func update(_ title: String) {
        self.stageTitleLabel.text = title
    }
}
