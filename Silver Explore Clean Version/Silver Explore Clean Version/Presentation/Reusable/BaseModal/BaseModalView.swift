//
//  ModalView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 4/13/24.
//

import UIKit

final class BaseModalView: UIView {
    private let headerView: HeaderView
    private(set) var contentView: UIView
    
    init(title: String, contentView: UIView) {
        self.headerView = HeaderView(title: title)
                            .backgroundColor(color: .mainTheme)
                            .textColor(color: .white)
                            .titleLabelFont(font: .systemFont(ofSize: 30, weight: .regular))
        self.contentView = contentView
        super.init(frame: .zero)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.backgroundColor = .init(white: 0, alpha: 0.5)
        self.configureContentView()
        self.configureHeaderView()
    }
    
    private func configureContentView() {
        self.addSubview(self.contentView)
        
        self.contentView
            .widthAnchor(self.widthAnchor, multiplier: 0.8)
            .heightAnchor(self.heightAnchor, multiplier: 0.7)
            .centerXAnchor(self.centerXAnchor)
            .centerYAnchor(self.centerYAnchor, constant: 50)
    }
    
    private func configureHeaderView() {
        self.addSubview(self.headerView)

        self.headerView
            .bottomAnchor(self.contentView.topAnchor)
            .widthAnchor(self.contentView.widthAnchor)
            .heightAnchor(self.contentView.heightAnchor, multiplier: 0.1)
            .centerXAnchor(self.centerXAnchor)
    }
}
