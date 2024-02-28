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

}
