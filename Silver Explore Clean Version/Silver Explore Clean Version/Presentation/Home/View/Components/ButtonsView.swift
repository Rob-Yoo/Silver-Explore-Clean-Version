//
//  ButtonsView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/19/24.
//

import UIKit

final class ButtonsView: UIView {
    var touchGestureExploreBtn: UIButton = {
        let btn = UIButton()
        
        btn.setImage(.touchGestureExplorer, for: .normal)
        return btn
    }()
    
    var kioskExploreBtn: UIButton = {
        let btn = UIButton()
        
        btn.setImage(.kioskExplorer, for: .normal)
        return btn
    }()
    
    var aiExploreBtn: UIButton = {
        let btn = UIButton()
        
        btn.setImage(.aiExplorer, for: .normal)
        return btn
    }()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
        buildViewHierachy()
        configureViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ButtonsView: ViewProtocol {
    func buildViewHierachy() {
        self.addSubview(touchGestureExploreBtn)
        self.addSubview(kioskExploreBtn)
        self.addSubview(aiExploreBtn)
    }
    
    func configureViewConstraints() {
        let btnWidth = UIImage.touchGestureExplorer.size.width
        let btnHeight = UIImage.touchGestureExplorer.size.height
        
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
