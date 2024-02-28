//
//  PrevButtonView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/26/24.
//

import UIKit

final class PrevButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configurePrevButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configurePrevButton() {
        let btnFont = UIFont.systemFont(ofSize: 30, weight: .semibold)
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 30, weight: .semibold)
        let btnImage = UIImage(systemName: "chevron.left", withConfiguration: imageConfiguration)
        
        self.setImage(btnImage, for: .normal)
        self.setTitle(" 이전", for: .normal)
        self.titleLabel?.font = btnFont
        self.setTitleColor(.black, for: .normal)
        self.tintColor = .black
        
        self.size(.init(width: 100, height: 50))
    }
    
    func title(_ text: String) -> Self {
        self.setTitle(" " + text, for: .normal)
        return self
    }
    
    func tintColor(_ color: UIColor) -> Self {
        self.setTitleColor(color, for: .normal)
        self.tintColor = color
        return self
    }
}
