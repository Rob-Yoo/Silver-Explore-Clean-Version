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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "The Silver Explorer"
        label.font = .systemFont(ofSize: 25, weight: .light)
        label.textAlignment = .center
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
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
        let constraints = [
            self.titleLabel.widthAnchor.constraint(equalToConstant: 300),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 170),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10),
            self.subtitleLabel.widthAnchor.constraint(equalToConstant: 200),
            self.subtitleLabel.heightAnchor.constraint(equalToConstant: 140),
            self.subtitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.subtitleLabel.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor, constant: 50)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
