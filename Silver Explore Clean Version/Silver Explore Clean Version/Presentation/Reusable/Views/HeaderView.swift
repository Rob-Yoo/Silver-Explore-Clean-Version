//
//  TitleStatckView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/19/24.
//

import UIKit

final class HeaderView: UIView {
    private var title: String
    private var subtitle: String

    private(set) lazy var titleLabel: UILabel = { title in
        let label = UILabel()
        
        label.text = title
        label.font = .systemFont(ofSize: 60, weight: .medium)
        label.textAlignment = .center
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8

        return label
    }(self.title)
    
    private(set) lazy var subtitleLabel: UILabel = { subtitle in
        let label = UILabel()
        
        label.text = subtitle
        label.font = .systemFont(ofSize: 30, weight: .light)
        label.textAlignment = .center
        label.textColor = .darkGray
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
    
        return label
    }(self.subtitle)
    
    init(title: String, subtitle: String = "") {
        self.title = title
        self.subtitle = subtitle
        super.init(frame: .zero)
        
        self.backgroundColor = .clear
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.configureTitleLabel()
        self.configureSubtitleLabel()
    }
    
    private func configureTitleLabel() {
        let centerYAnchorValue: CGFloat = self.subtitle.isEmpty ? 0 : -25

        self.addSubview(self.titleLabel)
        self.titleLabel
            .centerXAnchor(self.centerXAnchor)
            .centerYAnchor(self.centerYAnchor, constant: centerYAnchorValue)
    }
    
    private func configureSubtitleLabel() {
        if (self.subtitle.isEmpty) { return }
        
        self.addSubview(self.subtitleLabel)
        self.subtitleLabel
            .centerXAnchor(self.centerXAnchor)
            .centerYAnchor(self.centerYAnchor, constant: 30)
    }
}

//MARK: - View Modifiers

extension HeaderView {
    func backgroundColor(color: UIColor) -> Self {
        self.backgroundColor = color
        return self
    }
    
    func textColor(color: UIColor) -> Self {
        self.titleLabel.textColor = color
        self.subtitleLabel.textColor = color
        return self
    }
    
    func titleLabelFont(font: UIFont) -> Self {
        self.titleLabel.font = font
        return self
    }
    
    func subtitleLabelFont(font: UIFont) -> Self {
        if (!self.subtitle.isEmpty) {
            self.subtitleLabel.font = font
        }
        return self
    }
}
