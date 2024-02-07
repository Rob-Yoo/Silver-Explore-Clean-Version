//
//  HomeView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/1/24.
//

import UIKit

@objc protocol HomeViewDelegate: AnyObject {
    @objc func touchGestureExploreBtnTapped()
    @objc func kioskExploreBtnTapped()
    @objc func aiExploreBtnTapped()
}

final class HomeView: UIView {
    private let backgroundImageView = UIImageView(image: .mainBackground)
    private let titleLabelView = TitleLabelView(title: "은빛 탐험가", subtitle: "The Silver Explore")
    private let buttonsView = ExploreButtonsView()
    
    weak var homeViewDelegate: HomeViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//Mark: - AutoLayout
extension HomeView {
    private func configureSubviews() {
        configureBackgroundImageView()
        configureTitleLabelView()
        configureButtonsView()
    }
    
    private func configureBackgroundImageView() {
        self.addSubview(backgroundImageView)
        
        self.backgroundImageView
            .widthAnchor(self.widthAnchor)
            .heightAnchor(self.heightAnchor)
    }
    
    private func configureTitleLabelView() {
        self.addSubview(titleLabelView)

        self.titleLabelView
            .topAnchor(self.topAnchor, padding: 150)
            .widthAnchor(self.titleLabelView.titleLabel.widthAnchor)
            .heightAnchor(self.heightAnchor, multiplier: 0.15)
            .centerXAnchor(self.centerXAnchor)
    }
    
    private func configureButtonsView() {
        let viewWidth = UIImage.touchGestureExplorer.size.width
        let viewHeight = UIImage.touchGestureExplorer.size.height * 3.5
        
        self.addSubview(buttonsView)
        
        self.buttonsView
            .centerXAnchor(self.centerXAnchor)
            .centerYAnchor(self.centerYAnchor, constant: 100)
            .size(.init(width: viewWidth, height: viewHeight))
    }
}

//Mark: - User Action Listener
extension HomeView {
    func addUserActionListener() {
        guard let delegate = self.homeViewDelegate else {
            fatalError("Delegate 지정 후 호출해주세요!")
        }

        self.buttonsView.touchGestureExploreBtn.addTarget(delegate, action: #selector(delegate.touchGestureExploreBtnTapped), for: .touchUpInside)
        
        self.buttonsView.kioskExploreBtn.addTarget(delegate, action: #selector(delegate.kioskExploreBtnTapped), for: .touchUpInside)
        
        self.buttonsView.aiExploreBtn.addTarget(delegate, action: #selector(delegate.aiExploreBtnTapped), for: .touchUpInside)
    }
}
