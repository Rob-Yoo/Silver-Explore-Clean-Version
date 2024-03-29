//
//  KioskMainView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/29/24.
//

import UIKit

final class KioskMainView: UIView {
    private(set) var headerView = HeaderView(title: "은빛 탐험 카페", subtitle: "Silver Light Exploration Cafe")
    private(set) var menuBoardView = KioskMenuBoardView()
    private(set) var footerView = KioskFooterStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .mainTheme
        self.configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        self.configureHeaderView()
        self.configureMenuBoardView()
        self.configureFooterView()
    }
    
    private func configureHeaderView() {
        self.addSubview(self.headerView)
        
        self.headerView
            .textColor(color: .white)
            .titleLabelFont(font: .systemFont(ofSize: 35, weight: .light))
            .subtitleLabelFont(font: .systemFont(ofSize: 25, weight: .light))
            .topAnchor(self.safeAreaLayoutGuide.topAnchor)
            .widthAnchor(self.widthAnchor)
            .heightAnchor(self.heightAnchor, multiplier: 0.15)
    }
    
    private func configureMenuBoardView() {
        self.addSubview(self.menuBoardView)
        
        self.menuBoardView
            .topAnchor(self.headerView.bottomAnchor)
            .widthAnchor(self.widthAnchor)
            .heightAnchor(self.heightAnchor, multiplier: 0.6)
    }
    
    private func configureFooterView() {
        self.addSubview(self.footerView)
        
        self.footerView
            .topAnchor(self.menuBoardView.bottomAnchor, padding: 10)
            .leadingAnchor(self.leadingAnchor, padding: 10)
            .trailingAnchor(self.trailingAnchor, padding: -10)
            .bottomAnchor(self.safeAreaLayoutGuide.bottomAnchor)
    }
}
