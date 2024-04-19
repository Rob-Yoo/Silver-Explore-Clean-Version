//
//  DescriptionImageView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 4/20/24.
//

import UIKit

final class DescriptionImageView: UIView {
    private(set) var imageView: UIImageView
    
    init(image: UIImage) {
        self.imageView = UIImageView(image: image)
        super.init(frame: .zero)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.addSubview(self.imageView)
        self.imageView.contentMode = .scaleAspectFit
        self.imageView
            .widthAnchor(self.widthAnchor, multiplier: 0.5)
            .heightAnchor(self.heightAnchor, multiplier: 0.8)
            .centerXAnchor(self.centerXAnchor)
            .centerYAnchor(self.centerYAnchor)
    }
    
    func update(_ image: UIImage) {
        self.imageView.image = image
    }
}

