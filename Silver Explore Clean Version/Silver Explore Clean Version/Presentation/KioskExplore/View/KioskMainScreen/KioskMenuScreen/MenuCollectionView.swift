//
//  MenuCollectionView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/1/24.
//

import UIKit

final class MenuCollectionView: UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class MenuCollectionViewCell: UICollectionViewCell {
    private(set) var productImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private(set) var productNameView = LabelView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        self.configureProductImageView()
        self.configureProductNameView()
    }
    
    private func configureProductImageView() {
        self.addSubview(self.productImageView)
        
        self.productImageView
            .topAnchor(self.topAnchor)
            .widthAnchor(self.widthAnchor)
            .heightAnchor(self.heightAnchor, multiplier: 0.7)
    }
    
    private func configureProductNameView() {
        self.addSubview(self.productNameView)
        
        self.productNameView
            .topAnchor(self.productImageView.bottomAnchor)
            .bottomAnchor(self.bottomAnchor)
            .widthAnchor(self.widthAnchor)
    }
    
    func setItemImage(_ image: UIImage) {
        self.productImageView.image = image
    }
    
    func setItemName(_ name: String) {
        self.productNameView.label(name)
    }
}

