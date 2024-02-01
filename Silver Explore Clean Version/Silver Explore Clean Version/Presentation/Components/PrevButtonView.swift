//
//  PrevButtonView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/26/24.
//

import UIKit

final class PrevButtonView: UIView {
    var prevButton = {
        let button = UIButton()
        
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .semibold)), for: .normal)
        button.setTitle(" 이전", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        self.buildViewHierachy()
        self.configureViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PrevButtonView {
    func buildViewHierachy() {
        self.addSubview(prevButton)
    }
    
    func configureViewConstraints() {
        self.size(.init(width: 100, height: 50))
        self.prevButton
            .centerXAnchor(self.centerXAnchor)
            .centerYAnchor(self.centerYAnchor)
            .size(.init(width: 100, height: 50))
    }
    
}
