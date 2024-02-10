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
        self.exploreStageDescriptionView = BlurredExploreStageDescriptionView(effect: blurEffect)
        
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
            .widthAnchor(self.widthAnchor, multiplier: 0.7)
            .heightAnchor(self.heightAnchor, multiplier: 0.5)
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

final class BlurredExploreStageDescriptionView: UIVisualEffectView {
    private(set) var exploreStageDescriptionStackView = ExploreStageDescriptionStackView()
    
    override init(effect: UIVisualEffect?) {
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
}

final class ExploreStageDescriptionStackView: UIStackView {
    private(set) var descriptionImageView: UIView = {
        let view = UIView()
        let imageView = UIImageView(image: .tap)
        
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView
            .widthAnchor(view.widthAnchor, multiplier: 0.5)
            .heightAnchor(view.heightAnchor, multiplier: 0.8)
            .centerXAnchor(view.centerXAnchor)
            .centerYAnchor(view.centerYAnchor)
        return view
    }()
    
    private(set) var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "한 손가락을 사용해\n AR 캐릭터를 짧게 탭해보세요!"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private let exploreStartLabel: UILabel = {
        let label = UILabel()
        
        label.text = "터치하여 시작하기"
        label.font = .systemFont(ofSize: 35)
        label.textAlignment = .center
        label.textColor = .white
        
        return label
    }()
    
    private let lineView: UIView = {
        let line = UIView()
        line.backgroundColor = .white
        return line
    }()
    
    private var descriptionViews: [UIView] {
        return [self.descriptionImageView, self.descriptionLabel, self.exploreStartLabel]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fillEqually
        self.descriptionViews.forEach {
            self.addArrangedSubview($0)
        }
        
        self.configureLineView()
    }
    
    private func configureLineView() {
        guard let lastView = self.arrangedSubviews.last else { return }
        
        lastView.addSubview(self.lineView)
        self.lineView
            .topAnchor(lastView.topAnchor)
            .widthAnchor(lastView.widthAnchor)
            .heightAnchor(equalToConstant: 1)
    }
}
