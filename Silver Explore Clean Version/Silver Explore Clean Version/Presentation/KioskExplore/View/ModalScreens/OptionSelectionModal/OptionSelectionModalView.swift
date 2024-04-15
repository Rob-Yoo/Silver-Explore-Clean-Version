//
//  OptionSelectionModalView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 4/15/24.
//

import UIKit

final class OptionSelectionModalView: UIView {
    private(set) var headerView = HeaderView(title: "옵션 선택").backgroundColor(color: .mainTheme).textColor(color: .white).titleLabelFont(font: .systemFont(ofSize: 30, weight: .regular))
    private(set) var bodyView: OptionSelectionModalBodyView
    private(set) var separatorLineView = SeparatorLineView()
    private(set) var footerButtonsView = FooterButtonsView()
    
    init(product: Product) {
        self.bodyView = OptionSelectionModalBodyView(product: product)
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
            .topAnchor(self.separatorLineView.bottomAnchor, padding: 40)
            .bottomAnchor(self.bottomAnchor, padding: -40)
            .widthAnchor(self.widthAnchor, multiplier: 0.8)
            .centerXAnchor(self.centerXAnchor)
    }
}

