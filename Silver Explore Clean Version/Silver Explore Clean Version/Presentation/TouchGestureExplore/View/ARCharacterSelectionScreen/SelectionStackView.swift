//
//  CharacterImageView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/1/24.
//

import UIKit

final class SelectionStackView: UIStackView {
    private(set) var arrSelectionView = SelectionView(image: UIImage(resource: .arr), name: "아르")
    private(set) var finnSelectionView = SelectionView(image: UIImage(resource: .finn), name: "핀")
    private var selectionViews: [SelectionView] {
        return [arrSelectionView, finnSelectionView]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
        NotificationCenter.default.addObserver(self, selector: #selector(self.addUserAction(notification:)), name: .CharacterSelectionViewUserAction, object: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .CharacterSelectionViewUserAction, object: nil)
    }
    
    private func configureView() {
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fillEqually
        self.selectionViews.forEach {
            self.addArrangedSubview($0)
        }
    }
    
    @objc private func addUserAction(notification: Notification) {
        guard let delegate = notification.object as? CharacterSelectViewDelegate else {
            fatalError("SelectionStackView: 잘못된 Object가 Post 되었습니다!")
        }
        
        self.arrSelectionView.addGestureRecognizer(
            UITapGestureRecognizer(target: delegate, action: #selector(delegate.arrSelected))
        )
        self.finnSelectionView.addGestureRecognizer(
            UITapGestureRecognizer(target: delegate, action: #selector(delegate.finnSelected))
        )
    }
    
    func update(isSelectedView: UIView) {
        selectionViews.forEach {
            let isSelected = ($0 == isSelectedView)

            $0.radioButton.update(isSelected)
        }
    }
}
