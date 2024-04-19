//
//  BlurredExploreStageTitleView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 4/20/24.
//

import UIKit

final class BlurredExploreStageTitleView: UIVisualEffectView {
    private(set) var stageTitleLabel: UILabel = {
        let label = UILabel()

        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        return label
    }()
    
    init(effect: UIVisualEffect, title: String) {
        super.init(effect: effect)
        self.stageTitleLabel.text = title
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
