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
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fillEqually
        self.selectionViews.forEach {
            self.addArrangedSubview($0)
        }
    }
    
    func update(isSelectedView: UIView) {
        selectionViews.forEach {
            let isSelected = ($0 == isSelectedView)

            $0.radioButton.update(isSelected)
        }
    }
}
