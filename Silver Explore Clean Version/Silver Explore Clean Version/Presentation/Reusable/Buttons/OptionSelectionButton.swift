//
//  OptionSelectionButton.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/2/24.
//

import UIKit

final class MultiStateButton: UIButton {
    enum ButtonState {
        case selected, unselected, block
    }
    
    var buttonState: ButtonState
    var themeColor: UIColor

    init(state: ButtonState, title: String, color: UIColor = .tintColor)
    {
        self.buttonState = state
        self.themeColor = color
        super.init(frame: .zero)

        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        switch buttonState {
        case .selected:
            self.renderSelectedStateButton()
        case .unselected:
            self.renderUnselectedStateButton()
        case .block:
            self.renderBlockStateButton()
        }
    }
    
    private func renderSelectedStateButton() {
        self.layer.borderWidth = 2.0
        self.layer.cornerRadius = 10
        self.setTitleColor(.white, for: .normal)
        self.layer.backgroundColor = self.themeColor.cgColor
        self.layer.borderColor = self.themeColor.cgColor
    }
    
    private func renderUnselectedStateButton() {
        self.layer.borderWidth = 2.0
        self.layer.cornerRadius = 10
        self.setTitleColor(self.themeColor, for: .normal)
        self.layer.borderColor = self.themeColor.cgColor
        self.layer.backgroundColor = UIColor.clear.cgColor
    }
    
    private func renderBlockStateButton() {
        self.setTitleColor(.silverLight, for: .normal)
        self.backgroundColor = .clear
    }
}
