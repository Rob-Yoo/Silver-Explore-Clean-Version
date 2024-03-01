//
//  KioskFooterStackView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/1/24.
//

import UIKit

final class KioskFooterStackView: UIStackView {
    private(set) var kioskCartView = KioskCartView()
    private(set) var view = UIView()
    private var arrangedViews: [UIView] {
        return [kioskCartView, view]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
        self.view.backgroundColor = .white
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fillEqually
        self.spacing = 10

        self.arrangedViews.forEach {
            self.addArrangedSubview($0)
        }
    }
}
