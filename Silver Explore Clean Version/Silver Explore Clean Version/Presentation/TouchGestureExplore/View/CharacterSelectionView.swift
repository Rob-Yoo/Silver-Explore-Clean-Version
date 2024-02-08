//
//  CharacterSelectView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/1/24.
//

import UIKit

@objc protocol CharacterSelectViewDelegate: AnyObject {
    @objc func prevButtonTapped()
    @objc func exploreStartButtonTapped()
    @objc func arrSelected(recognizer: UITapGestureRecognizer)
    @objc func finnSelected(recognizer: UITapGestureRecognizer)
}

final class CharacterSelectionView: UIView {
    private(set) var backgroundImageView = UIImageView(image: .mainBackground)
    private(set) var prevButton = PrevButton()
    private(set) var titleView = TitleView(title: "AR 캐릭터 선택하기", subtitle: "원하는 캐릭터를 터치해주세요")
    private(set) var selectionStackView = SelectionStackView()
    private(set) var exploreStartBtn = ImageButton(image: .exploreStart)
    
    weak var characterSelectViewDelegate: CharacterSelectViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - AutoLayout
extension CharacterSelectionView {
    private func configureSubViews() {
        self.configureBackgroundImageView()
        self.configureTitleView()
        self.configurePrevButton()
        self.configureSelectionView()
        self.configureExploreStartBtn()
    }
    
    private func configureBackgroundImageView() {
        self.addSubview(backgroundImageView)
        
        self.backgroundImageView
            .widthAnchor(self.widthAnchor)
            .heightAnchor(self.heightAnchor)
    }
    
    private func configureTitleView() {
        self.addSubview(titleView)
        
        self.titleView
            .topAnchor(self.topAnchor, padding: 100)
            .widthAnchor(self.titleView.titleLabel.widthAnchor)
            .heightAnchor(self.heightAnchor, multiplier: 0.15)
            .centerXAnchor(self.centerXAnchor)
    }
    
    private func configurePrevButton() {
        self.addSubview(prevButton)
        
        self.prevButton
            .topAnchor(self.safeAreaLayoutGuide.topAnchor, padding: 20)
            .leadingAnchor(self.leadingAnchor, padding: 20)
    }
    
    private func configureSelectionView() {
        self.addSubview(selectionStackView)
        
        self.selectionStackView
            .widthAnchor(self.widthAnchor)
            .heightAnchor(self.heightAnchor, multiplier: 0.35)
            .centerXAnchor(self.centerXAnchor)
            .centerYAnchor(self.centerYAnchor, constant: 20)
    }
    
    private func configureExploreStartBtn() {
        let btnWidth = UIImage.exploreStart.size.width
        let btnHeight = UIImage.exploreStart.size.height

        self.addSubview(exploreStartBtn)
        
        self.exploreStartBtn
            .centerXAnchor(self.centerXAnchor)
            .bottomAnchor(self.bottomAnchor, padding: -70)
            .size(.init(width: btnWidth, height: btnHeight))
    }
}

//MARK: - Communicate With ViewController
extension CharacterSelectionView {
    func addUserActionListener() {
        guard let delegate = self.characterSelectViewDelegate else {
            fatalError("CharacterSelectViewDelegate 지정 후 호출해주세요!")
        }

        self.prevButton.addTarget(delegate, action: #selector(delegate.prevButtonTapped), for: .touchUpInside)

        self.selectionStackView.arrSelectionView.addGestureRecognizer(
            UITapGestureRecognizer(target: delegate, action: #selector(delegate.arrSelected))
        )
        
        self.selectionStackView.finnSelectionView.addGestureRecognizer(
            UITapGestureRecognizer(target: delegate, action: #selector(delegate.finnSelected))
        )
        
        self.exploreStartBtn.addTarget(delegate, action: #selector(delegate.exploreStartButtonTapped), for: .touchUpInside)
    }
    
    func update(_ willUpdateView: UIView) {
        self.selectionStackView.update(isSelectedView: willUpdateView)
    }
}
