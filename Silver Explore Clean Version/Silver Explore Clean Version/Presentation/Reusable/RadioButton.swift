//
//  RadioButton.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/1/24.
//

import UIKit

final class RadioButton: UIButton {
    private let imageSize = 40.0
    var isChecked = false {
        didSet {
            update()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        let image = UIImage(systemName: "circle")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: self.imageSize))
        
        self.setImage(image, for: .normal)
        self.tintColor = .systemBlue
    }
    
    private func update() {
        let image = UIImage(systemName: self.isChecked ? "checkmark.circle.fill" : "circle")?
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: 40.0))

        self.setImage(image, for: .normal)
    }
}
