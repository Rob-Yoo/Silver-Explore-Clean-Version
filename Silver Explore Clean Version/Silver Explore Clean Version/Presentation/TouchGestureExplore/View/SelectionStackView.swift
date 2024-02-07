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
    
    func update(_ selectionView: UIView) {
        selectionViews.forEach {
            $0.radioButton.isChecked = ($0 == selectionView)
        }
    }
}

final class SelectionView: UIView {
    private var image: UIImage
    private var name: String

    private lazy var imageView = { image in
        let imgView = UIImageView()
        
        imgView.image = image
        imgView.contentMode = .scaleAspectFit
        return imgView
    }(self.image)

    private lazy var nameLabel = { name in
        let label = UILabel()
        
        label.text = name
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 40, weight: .medium)
        return label
    }(self.name)

    var radioButton = RadioButton()
    
    init(image: UIImage, name: String) {
        self.name = name
        self.image = image
        super.init(frame: .zero)
        self.configureSelectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSelectionView() {
        self.addSubview(imageView)
        self.addSubview(nameLabel)
        self.addSubview(radioButton)
        
        self.imageView
            .widthAnchor(self.widthAnchor)
            .topAnchor(self.topAnchor)
            .heightAnchor(self.heightAnchor, multiplier: 0.7)
        
        self.nameLabel
            .centerXAnchor(self.centerXAnchor)
            .topAnchor(self.imageView.bottomAnchor, padding: 30)
        
        self.radioButton
            .centerXAnchor(self.centerXAnchor)
            .topAnchor(self.nameLabel.bottomAnchor, padding: 30)
    }
}
