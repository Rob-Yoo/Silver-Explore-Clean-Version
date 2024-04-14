//
//  ModalView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 4/13/24.
//

import UIKit

final class BaseModalView<ContentView: UIView>: UIView {
    private(set) var contentView: ModalContentView<ContentView>
    
    init(title: String) {
        self.contentView = ModalContentView<ContentView>(title: title)
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.backgroundColor = .init(white: 0, alpha: 0.5)
        self.addSubview(self.contentView)
        
        self.contentView
            .widthAnchor(self.widthAnchor, multiplier: 0.8)
            .heightAnchor(self.heightAnchor, multiplier: 0.8)
            .centerXAnchor(self.centerXAnchor)
            .centerYAnchor(self.centerYAnchor)
    }
}

final class ModalContentView<ContentView: UIView>: UIView {
    private(set) var headerView: HeaderView
    private(set) var bodyView = ContentView()
    private(set) lazy var separatorLineView = SeparatorLineView()
    private(set) lazy var footerButtonsView = UIView()

    init(title: String) {
        self.headerView = HeaderView(title: title)
                            .backgroundColor(color: .mainTheme)
                            .textColor(color: .white)
                            .titleLabelFont(font: .systemFont(ofSize: 30, weight: .regular))

        super.init(frame: .zero)
        self.backgroundColor = .white
        self.configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        self.configureHeaderView()
        self.configureBodyView()
        self.configureSeparatorLineView()
        self.configureFooterButtonsView()
    }
    
    private func configureHeaderView() {
        self.addSubview(self.headerView)
        
        self.headerView
            .topAnchor(self.topAnchor)
            .widthAnchor(self.widthAnchor)
            .heightAnchor(self.heightAnchor, multiplier: 0.1)
    }
    
    private func configureBodyView() {
        self.addSubview(self.bodyView)
        
        self.bodyView
            .topAnchor(self.headerView.bottomAnchor)
            .widthAnchor(self.widthAnchor)
            .heightAnchor(self.heightAnchor, multiplier: 0.75)
    }
    
    private func configureSeparatorLineView() {
        self.addSubview(self.separatorLineView)
        
        self.separatorLineView
            .topAnchor(self.bodyView.bottomAnchor)
            .widthAnchor(self.widthAnchor)
            .heightAnchor(equalToConstant: 3)
    }
    
    private func configureFooterButtonsView() {
        self.addSubview(self.footerButtonsView)
        
        self.footerButtonsView
            .topAnchor(self.separatorLineView.bottomAnchor)
            .bottomAnchor(self.bottomAnchor)
            .widthAnchor(self.widthAnchor)
    }
}


