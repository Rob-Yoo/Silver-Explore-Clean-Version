//
//  ButtonsView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/19/24.
//

import UIKit

final class ExploreButtonsView: UIView {
    private(set) var touchGestureExploreBtn = ImageButton(image: .touchGestureExplorer)
    private(set) var kioskExploreBtn = ImageButton(image: .kioskExplorer)
    private(set) var aiExploreBtn = ImageButton(image: .aiExplorer)
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
        self.configureSubviews()
        NotificationCenter.default.addObserver(self, selector: #selector(self.addUserAction(notification:)), name: .HomeViewUserAction, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func configureSubviews() {
        let btnWidth = UIImage.touchGestureExplorer.size.width
        let btnHeight = UIImage.touchGestureExplorer.size.height
        
        self.addSubview(touchGestureExploreBtn)
        self.addSubview(kioskExploreBtn)
        self.addSubview(aiExploreBtn)
        
        self.touchGestureExploreBtn
            .topAnchor(self.topAnchor)
            .centerXAnchor(self.centerXAnchor)
            .size(.init(width: btnWidth, height: btnHeight))
        
        self.kioskExploreBtn
            .centerXAnchor(self.centerXAnchor)
            .centerYAnchor(self.centerYAnchor)
            .size(.init(width: btnWidth, height: btnHeight))
        
        self.aiExploreBtn
            .bottomAnchor(self.bottomAnchor)
            .centerXAnchor(self.centerXAnchor)
            .size(.init(width: btnWidth, height: btnHeight))
    }
    
    @objc private func addUserAction(notification: Notification) {
        guard let delegate = notification.object as? HomeViewDelegate else {
            fatalError("ExploreButtonsView: 잘못된 Object가 Post 되었습니다!")
        }

        self.touchGestureExploreBtn.addTarget(delegate, action: #selector(delegate.touchGestureExploreBtnTapped), for: .touchUpInside)
        self.kioskExploreBtn.addTarget(delegate, action: #selector(delegate.kioskExploreBtnTapped), for: .touchUpInside)
        self.aiExploreBtn.addTarget(delegate, action: #selector(delegate.aiExploreBtnTapped), for: .touchUpInside)
    }
}
