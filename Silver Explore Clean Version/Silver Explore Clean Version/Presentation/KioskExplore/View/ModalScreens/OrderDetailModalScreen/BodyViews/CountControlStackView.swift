//
//  CountControlStackView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/2/24.
//

import UIKit

final class CountControlStackView: UIStackView {
    private(set) var minusButton: UIButton
    private(set) var plusButton: UIButton
    private(set) var countLabel: TextLabel
    
    private var arrangedViews: [UIView] {
        return [minusButton, countLabel, plusButton]
    }
    
    init(ofSize: CGFloat, tinColor: UIColor = .mainTheme, initCount: Int = 1) {
        let font = UIFont.systemFont(ofSize: ofSize, weight: .bold)
        
        self.minusButton = ImageButton.createSFSymbolButton(systemName: "minus.circle.fill", font: font, tintColor: .mainTheme)
        self.plusButton = ImageButton.createSFSymbolButton(systemName: "plus.circle.fill", font: font, tintColor: .mainTheme)
        self.countLabel = TextLabel(text: "\(initCount)").font(font)

        super.init(frame: .zero)
        self.configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .fillEqually
        self.arrangedViews.forEach {
            self.addArrangedSubview($0)
        }
    }
    
    func update(count: Int) {
        self.countLabel.text = String(count)
    }
}
