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
    
    init(effect: UIBlurEffect, stageTitle: String) {
        self.prevButton = BlurredButton.makePrevButton(blurEffect: effect)
        self.nextButton = BlurredButton.makeNextButton(blurEffect: effect)
        self.exploreStageTitleView = BlurredExploreStageTitleView(effect: effect, title: stageTitle)

        super.init(frame: .zero)

        self.configure()
        NotificationCenter.default.addObserver(self, selector: #selector(self.addUserAction(notification:)), name: .ARSceneViewUserAction, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .ARSceneViewUserAction, object: nil)
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
    
    @objc private func addUserAction(notification: Notification) {
        guard let delegate = notification.object as? ARSceneViewDelegate else {
            fatalError("BlurredExploreIndicatorStackView: 잘못된 Object가 Post 되었습니다!")
        }

        self.prevButton.addTarget(delegate, action: #selector(delegate.prevButtonTapped), for: .touchUpInside)
        self.nextButton.addTarget(delegate, action: #selector(delegate.nextButtonTapped), for: .touchUpInside)
    }
    
    func update(_ title: String) {
        self.exploreStageTitleView.update(title)
    }
}
