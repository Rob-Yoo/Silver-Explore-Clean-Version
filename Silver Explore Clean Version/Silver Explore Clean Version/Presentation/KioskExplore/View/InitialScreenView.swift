//
//  InitialScreenView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/25/24.
//

import UIKit

final class InitialScreenView: UIView {
    private(set) var prevButton = PrevButton().title("나가기").tintColor(.white)
    private(set) var backgroundImageView = UIImageView(image: .kioskMain)
    
    override init(frame: CGRect) {
        super.init(frame: <#T##CGRect#>)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        
    }
}
