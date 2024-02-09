//
//  BlurEffectView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/8/24.
//

import UIKit

class BlurredButton: UIButton {
    private let blurEffectView: UIVisualEffectView
    private let buttonFont: UIFont

    init(blurEffect: UIBlurEffect,
         font: UIFont = .systemFont(ofSize: 25, weight: .semibold)
    ) {
        self.blurEffectView = UIVisualEffectView(effect: blurEffect)
        self.buttonFont = font
        super.init(frame: .zero)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.insertSubview(self.blurEffectView, belowSubview: self.imageView ?? self)
        self.blurEffectView.isUserInteractionEnabled = false
        self.blurEffectView
            .widthAnchor(self.widthAnchor)
            .heightAnchor(self.heightAnchor)
    }
    
    private func setButtonTitle(title: String, imageName: String = "", semanticContentAttribute: UISemanticContentAttribute = .unspecified) {
        if !(imageName.isEmpty) {
            let image = UIImage(systemName: imageName, withConfiguration: UIImage.SymbolConfiguration(font: self.buttonFont))
            self.setImage(image, for: .normal)
        }

        self.setTitle(title, for: .normal)
        self.titleLabel?.font = self.buttonFont
        self.tintColor = .white
        self.semanticContentAttribute = semanticContentAttribute
    }
}

extension BlurredButton {
    static func makePrevButton(blurEffect: UIBlurEffect) -> BlurredButton {
        let blurEffectButton = BlurredButton(blurEffect: blurEffect)
        let imageName = "chevron.left"
        
        blurEffectButton.setButtonTitle(title: " 이전", imageName: imageName, semanticContentAttribute: .forceLeftToRight)

        return blurEffectButton
    }
    
    static func makeNextButton(blurEffect: UIBlurEffect) -> BlurredButton {
        let blurEffectButton = BlurredButton(blurEffect: blurEffect)
        let imageName = "chevron.right"
        
        blurEffectButton.setButtonTitle(title: "다음 ", imageName: imageName, semanticContentAttribute: .forceRightToLeft)

        return blurEffectButton
    }
}
