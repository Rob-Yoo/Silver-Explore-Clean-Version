//
//  TitleStatckView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/19/24.
//

import UIKit

final class TitleLabelView: UIView {
    private var title: String
    private var subtitle: String

    lazy var titleLabel: UILabel = { title in
        let label = UILabel()
        
        label.text = title
        label.font = .systemFont(ofSize: 60, weight: .medium)
        label.textAlignment = .center
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8

        return label
    }(self.title)
    
    lazy var subtitleLabel: UILabel = { subtitle in
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
        self.buildViewHierachy()
        self.configureViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TitleLabelView {
    func buildViewHierachy() {
        self.addSubview(titleLabel)
        if !(self.subtitle.isEmpty) { self.addSubview(subtitleLabel) }
    }

    func configureViewConstraints() {
        let centerYAnchorValue: CGFloat = self.subtitle.isEmpty ? 0 : -30

        self.titleLabel
            .centerXAnchor(self.centerXAnchor)
            .centerYAnchor(self.centerYAnchor, constant: centerYAnchorValue)
            .size(.init(width: 600, height: 200))
        
        if !(self.subtitle.isEmpty) {
            self.subtitleLabel
                .centerXAnchor(self.centerXAnchor)
                .centerYAnchor(self.centerYAnchor, constant: 40)
                .size(.init(width: 600, height: 200))
        }
    }
}
