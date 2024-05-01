//
//  FooterButtonsView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 4/15/24.
//

import UIKit

class FooterButtonsView: UIStackView {
    private(set) var cancelButton: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("취소", for: .normal)
        btn.backgroundColor = .silverLight
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    private(set) var addCartButton: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("담기", for: .normal)
        btn.backgroundColor = .mainTheme
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    private var arrangedViews: [UIButton] {
        return [self.cancelButton, self.addCartButton]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
        NotificationCenter.default.addObserver(self, selector: #selector(self.addUserAction(notification:)), name: .OrderDetailViewUserAction, object: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .OrderDetailViewUserAction, object: nil)
    }
    
    private func configure() {
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fillEqually
        self.spacing = 100

        self.arrangedViews.forEach {
            self.addArrangedSubview($0)
        }
    }

    @objc private func addUserAction(notification: Notification) {
        guard let delegate = notification.object as? OrderDetailModalViewDelegate else {
            fatalError("FooterButtonsView: 잘못된 Object가 Post 되었습니다!")
        }
        
        self.cancelButton.addTarget(delegate, action: #selector(delegate.cancelButtonTapped), for: .touchUpInside)
        self.addCartButton.addTarget(delegate, action: #selector(delegate.addCartButtonTapped), for: .touchUpInside)
    }
}
