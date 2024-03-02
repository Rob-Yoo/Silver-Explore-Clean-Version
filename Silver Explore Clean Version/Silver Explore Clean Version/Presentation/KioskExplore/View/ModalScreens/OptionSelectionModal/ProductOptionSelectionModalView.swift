//
//  ProductOptionSelectionModalView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/2/24.
//

import UIKit

//MARK: - ProductOptionSelectionModalView
final class ProductOptionSelectionModalView: UIView {
    private(set) var optionSelectionView = OptionSelectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.backgroundColor = .init(white: 0, alpha: 0.5)
        self.addSubview(self.optionSelectionView)
        
        self.optionSelectionView
            .widthAnchor(self.widthAnchor, multiplier: 0.8)
            .heightAnchor(self.heightAnchor, multiplier: 0.8)
            .centerXAnchor(self.centerXAnchor)
            .centerYAnchor(self.centerYAnchor)
    }
}

// MARK: - OptionSelectionView
final class OptionSelectionView: UIView {
    private(set) var headerView = HeaderView(title: "옵션 선택").backgroundColor(color: .mainTheme).textColor(color: .white).titleLabelFont(font: .systemFont(ofSize: 30, weight: .regular))
    private(set) var bodyView = OptionSelectionBodyView()
    private(set) var separatorLineView = SeparatorLineView()
    private(set) var footerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        self.configureFooterView()
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
            .heightAnchor(equalToConstant: 1)
    }
    
    private func configureFooterView() {
        self.addSubview(self.footerView)
        
        self.footerView
            .topAnchor(self.separatorLineView.bottomAnchor)
            .bottomAnchor(self.bottomAnchor)
            .widthAnchor(self.widthAnchor)
    }
}
