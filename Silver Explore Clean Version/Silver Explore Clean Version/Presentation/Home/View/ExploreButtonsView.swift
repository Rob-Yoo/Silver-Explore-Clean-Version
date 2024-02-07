//
//  ButtonsView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/19/24.
//

import UIKit

final class ExploreButtonsView: UIView {
    var touchGestureExploreBtn = ImageButton(image: .touchGestureExplorer)
    var kioskExploreBtn = ImageButton(image: .kioskExplorer)
    var aiExploreBtn: UIButton = ImageButton(image: .aiExplorer)
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
        configureSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubViews() {
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
}
