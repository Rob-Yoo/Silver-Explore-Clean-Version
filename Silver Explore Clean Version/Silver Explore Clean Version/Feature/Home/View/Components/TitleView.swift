//
//  TitleStatckView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/19/24.
//

import UIKit

final class TitleView: UIView {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "은빛 탐험가"
        label.font = .systemFont(ofSize: 60, weight: .medium)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "The Silver Explorer"
        label.font = .systemFont(ofSize: 25, weight: .light)
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
        buildViewHierachy()
        applyConstraintsToView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TitleView: ViewProtocol {
    func buildViewHierachy() {
        self.addSubview(titleLabel)
        self.addSubview(subtitleLabel)
    }
    
    func applyConstraintsToView() {
        self.titleLabel
            .centerXAnchor(self.centerXAnchor)
            .centerYAnchor(self.centerYAnchor, constant: -30)
            .size(.init(width: 300, height: 170))
        
        self.subtitleLabel
            .centerXAnchor(self.centerXAnchor)
            .centerYAnchor(self.centerYAnchor, constant: 30)
            .size(.init(width: 200, height: 140))
    }
}
