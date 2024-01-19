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
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var kioskExploreBtn: UIButton = {
        let btn = UIButton()
        
        btn.setImage(.kioskExplorer, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var aiExploreBtn: UIButton = {
        let btn = UIButton()
        
        btn.setImage(.aiExplorer, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
        buildViewHierachy()
        applyConstraintsToView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ButtonsView: Presentable {
    func buildViewHierachy() {
        self.addSubview(touchGestureExploreBtn)
        self.addSubview(kioskExploreBtn)
        self.addSubview(aiExploreBtn)
    }
    
    func applyConstraintsToView() {
        let btnWidth = UIImage.touchGestureExplorer.size.width
        let btnHeight = UIImage.touchGestureExplorer.size.height
        
        applyTouchGestureExploreBtnConstraints(btnWidth, btnHeight)
        applyKioskExploreBtnConstraints(btnWidth, btnHeight)
        applyAIExploreBtnConstraints(btnWidth, btnHeight)
    }
    
    private func applyTouchGestureExploreBtnConstraints(_ btnWidth: CGFloat, _ btnHeight: CGFloat) {
        let touchGestureExploreBtnConstraints = [
            self.touchGestureExploreBtn.topAnchor.constraint(equalTo: self.topAnchor),
            self.touchGestureExploreBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.touchGestureExploreBtn.widthAnchor.constraint(equalToConstant: btnWidth),
            self.touchGestureExploreBtn.heightAnchor.constraint(equalToConstant: btnHeight)
        ]
        
        NSLayoutConstraint.activate(touchGestureExploreBtnConstraints)
    }
    
    private func applyKioskExploreBtnConstraints(_ btnWidth: CGFloat, _ btnHeight: CGFloat) {
        let kioskExploreBtnConstraints = [
            self.kioskExploreBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.kioskExploreBtn.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.kioskExploreBtn.widthAnchor.constraint(equalToConstant: btnWidth),
            self.kioskExploreBtn.heightAnchor.constraint(equalToConstant: btnHeight)
        ]
        
        NSLayoutConstraint.activate(kioskExploreBtnConstraints)
    }
    
    private func applyAIExploreBtnConstraints(_ btnWidth: CGFloat, _ btnHeight: CGFloat) {
        let aiExploreBtnConstraints = [
            self.aiExploreBtn.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.aiExploreBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.aiExploreBtn.widthAnchor.constraint(equalToConstant: btnWidth),
            self.aiExploreBtn.heightAnchor.constraint(equalToConstant: btnHeight)
        ]
        
        NSLayoutConstraint.activate(aiExploreBtnConstraints)
    }
}
