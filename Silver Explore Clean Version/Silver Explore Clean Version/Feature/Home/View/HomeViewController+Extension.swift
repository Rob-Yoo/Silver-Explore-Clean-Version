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
        addBackgroundImageViewConstraints()
        addTitleViewConstraints()
        addButtonsViewConstraints()
    }
    
    private func addBackgroundImageViewConstraints() {
        let constraints = [
            self.backgroundImageView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            self.backgroundImageView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        ]
        
        self.backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addTitleViewConstraints() {
        let constraints = [
            self.titleView.widthAnchor.constraint(equalTo: self.titleView.titleLabel.widthAnchor),
            self.titleView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.15),
            self.titleView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.titleView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150)
        ]
        
        self.titleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addButtonsViewConstraints() {
        let constraints = [
            self.buttonsView.widthAnchor.constraint(equalToConstant: UIImage.touchGestureExplorer.size.width),
            self.buttonsView.heightAnchor.constraint(equalToConstant: UIImage.touchGestureExplorer.size.height * 3.5),
            self.buttonsView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.buttonsView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.height * 0.1)
        ]
        
        self.buttonsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
}
