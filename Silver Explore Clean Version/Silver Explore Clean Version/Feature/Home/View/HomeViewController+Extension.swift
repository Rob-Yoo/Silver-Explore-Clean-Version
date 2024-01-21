//
//  HomeViewController+Extension.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/20/24.
//

import UIKit

//MARK: - Compose Subviews
extension HomeViewController: ViewProtocol {
    func buildViewHierachy() {
        self.view.addSubview(self.backgroundImageView)
        self.view.addSubview(self.titleView)
        self.view.addSubview(self.buttonsView)
    }
    
    func applyConstraintsToView() {
        addBackGroundImageViewConstraints()
        addTitleViewConstraints()
        addButtonsViewConstraints()
    }
    
    private func addBackGroundImageViewConstraints() {
        self.backgroundImageView
            .widthAnchor(self.view.widthAnchor)
            .heightAnchor(self.view.heightAnchor)
    }
    
    private func addTitleViewConstraints() {
        self.titleView
            .topAnchor(self.view.topAnchor, padding: 150)
            .widthAnchor(self.titleView.titleLabel.widthAnchor)
            .heightAnchor(self.view.heightAnchor, multiplier: 0.15)
            .centerXAnchor(self.view.centerXAnchor)
    }
    
    private func addButtonsViewConstraints() {
        let viewWidth = UIImage.touchGestureExplorer.size.width
        let viewHeight = UIImage.touchGestureExplorer.size.height * 3.5
        
        self.buttonsView
            .centerXAnchor(self.view.centerXAnchor)
            .centerYAnchor(self.view.centerYAnchor, constant: 100)
            .size(.init(width: viewWidth, height: viewHeight))
    }
}
