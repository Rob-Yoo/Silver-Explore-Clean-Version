//
//  OnboardingView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/8/24.
//

import UIKit

final class OnboardingView: UIView {
    private let blurEffectBackgroundView = UIVisualEffectView(effect: UIBlurEffect.init(style: .systemUltraThinMaterialDark))
    private let onboardingGuideView = OnboardingGuideView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.configureSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubViews() {
        self.configureBlurEffectBackgroundView()
        self.configureOnboardingGuideView()
    }
    
    private func configureBlurEffectBackgroundView() {
        self.addSubview(self.blurEffectBackgroundView)
        
        self.blurEffectBackgroundView.layer.cornerRadius = 30
        self.blurEffectBackgroundView.clipsToBounds = true
        
        self.blurEffectBackgroundView
            .widthAnchor(self.widthAnchor, multiplier: 0.8)
            .heightAnchor(self.heightAnchor, multiplier: 0.6)
            .centerXAnchor(self.centerXAnchor)
            .centerYAnchor(self.centerYAnchor)
    }
    
    private func configureOnboardingGuideView() {
        self.addSubview(self.onboardingGuideView)
        
        self.onboardingGuideView
            .widthAnchor(self.blurEffectBackgroundView.widthAnchor, multiplier: 0.8)
            .heightAnchor(self.blurEffectBackgroundView.heightAnchor, multiplier: 0.8)
            .centerXAnchor(self.centerXAnchor)
            .centerYAnchor(self.centerYAnchor)
    }
}

final class OnboardingGuideView: UIView {
    private let ticketImageView = UIImageView(image: .ticket)
    private let guideLabel = {
        let label = UILabel()
        
        label.text = "카메라 앞에 위 그림처럼 티켓을 놓아주세요."
        label.textColor = .white
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center

        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.layer.cornerRadius = 30
        self.clipsToBounds = true
        self.configureSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubViews() {
        self.configureTicketImageView()
        self.configureGuideLabel()
    }
    
    private func configureTicketImageView() {
        self.addSubview(ticketImageView)

        self.ticketImageView
            .topAnchor(self.topAnchor, padding: 20)
            .widthAnchor(self.widthAnchor)
            .heightAnchor(self.heightAnchor, multiplier: 0.7)
            .centerXAnchor(self.centerXAnchor)
        
        self.ticketImageView.contentMode = .scaleAspectFit
    }
    
    private func configureGuideLabel() {
        self.addSubview(self.guideLabel)
        
        self.guideLabel
            .widthAnchor(self.widthAnchor)
            .bottomAnchor(self.bottomAnchor, padding: -30)
            .centerXAnchor(self.centerXAnchor)
    }
}


