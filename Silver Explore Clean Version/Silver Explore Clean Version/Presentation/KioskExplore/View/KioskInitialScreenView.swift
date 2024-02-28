//
//  InitialScreenView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/25/24.
//

import UIKit

final class KioskInitialScreenView: UIView {
    private(set) var prevButton = PrevButton().title("종료").tintColor(.white)
    private(set) var backgroundImageView = UIImageView(image: .kioskMain)
    private(set) var buttonStackView = ButtonStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        self.backgroundColor = UIColor.mainTheme
        self.configurePrevButton()
        self.configureBackgroundImageView()
        self.configureButtonStackView()
    }
    
    private func configurePrevButton() {
        self.addSubview(self.prevButton)
        
        self.prevButton
            .topAnchor(self.safeAreaLayoutGuide.topAnchor, padding: 20)
            .leadingAnchor(self.leadingAnchor, padding: 20)
            .size(.init(width: 120, height: 40))
    }
    
    private func configureBackgroundImageView() {
        self.addSubview(self.backgroundImageView)
        
        self.backgroundImageView.contentMode = .scaleAspectFit
        self.backgroundImageView
            .topAnchor(self.prevButton.topAnchor, padding: 50)
            .widthAnchor(self.widthAnchor)
            .heightAnchor(self.heightAnchor, multiplier: 0.7)
            .centerXAnchor(self.centerXAnchor)
    }
    
    private func configureButtonStackView() {
        self.addSubview(self.buttonStackView)
        
        self.buttonStackView
            .bottomAnchor(self.bottomAnchor)
            .widthAnchor(self.widthAnchor)
            .heightAnchor(self.heightAnchor, multiplier: 0.2)
            .centerXAnchor(self.centerXAnchor)
    }
}

final class ButtonStackView: UIStackView {
    private(set) var dineInButtonView = ImageButtonView(image: .dineInButton)
    private(set) var takeOutButtonView = ImageButtonView(image: .takeOutButton)

    private var buttonViews: [UIView] {
        return [dineInButtonView, takeOutButtonView]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fillEqually
        self.buttonViews.forEach {
            self.addArrangedSubview($0)
        }
    }
}

final class ImageButtonView: UIView {
    private(set) var imageButton: ImageButton
    
    init(image: UIImage) {
        self.imageButton = ImageButton(image: image)
        super.init(frame: .zero)
        self.configure()
        self.addUserActionListener()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.addSubview(self.imageButton)

        self.imageButton
            .widthAnchor(self.widthAnchor, multiplier: 0.7)
            .heightAnchor(self.heightAnchor, multiplier: 0.7)
            .centerXAnchor(self.centerXAnchor)
            .centerYAnchor(self.centerYAnchor)
            .imageView?
            .widthAnchor(self.imageButton.widthAnchor)
            .heightAnchor(self.imageButton.heightAnchor)
    }
    
    private func addUserActionListener() {
        self.imageButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        NavigationManager.shared.push(KioskMainViewController())
    }
}
