//
//  OrderCountControlStackView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/1/24.
//

import UIKit

final class OrderCountControlStackView: UIStackView {
    private(set) lazy var minusButton = makeImageButton(imageName: "minus.circle.fill", tintColor: .lightGray)
    private(set) lazy var plusButton = makeImageButton(imageName: "plus.circle.fill", tintColor: .lightGray)
    private(set) lazy var deleteButton = makeImageButton(imageName: "xmark.app.fill", tintColor: .red)
    private(set) var orderCountLabel: UILabel = {
        let label = UILabel()
        
        label.text = "1"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()

    private var arrangedViews: [UIView] {
        return [minusButton, orderCountLabel, plusButton, deleteButton]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeImageButton(imageName: String, tintColor: UIColor) -> UIButton {
        let imageConfiguration = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 25, weight: .bold))
        let image = UIImage(systemName: imageName, withConfiguration: imageConfiguration)!
            .withTintColor(tintColor, renderingMode: .alwaysOriginal)
        let imageButton = ImageButton(image: image)
        
        imageButton.setTitleColor(.black, for: .normal)
        return imageButton
    }
    
    private func configure() {
        self.axis = .horizontal
        self.alignment = .fill
        self.spacing = 10
        self.distribution = .fillEqually
        self.arrangedViews.forEach {
            self.addArrangedSubview($0)
        }
    }
}
