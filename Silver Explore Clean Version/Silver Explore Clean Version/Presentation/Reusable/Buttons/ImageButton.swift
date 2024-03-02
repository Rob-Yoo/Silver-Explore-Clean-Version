//
//  ImageButton.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/7/24.
//

import UIKit

final class ImageButton: UIButton {
    
    init(image: UIImage) {
        super.init(frame: .zero)
        self.setImage(image, for: .normal)
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func createSFSymbolButton(systemName: String, font: UIFont, tintColor: UIColor) -> UIButton {
        let imageConfiguration = UIImage.SymbolConfiguration(font: font)
        let image = UIImage(systemName: systemName, withConfiguration: imageConfiguration)!
            .withTintColor(tintColor, renderingMode: .alwaysOriginal)
        let imageButton = ImageButton(image: image)
        
        imageButton.setTitleColor(.black, for: .normal)
        return imageButton
    }

}
