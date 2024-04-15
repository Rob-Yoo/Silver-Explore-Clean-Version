//
//  TemparatureOptionView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/2/24.
//

import UIKit

final class TemperatureOptionView: UIStackView {
    private(set) var hotButton: MultiStateButton
    private(set) var iceButton: MultiStateButton
    private var arrangedViews: [UIView] {
        return [hotButton, iceButton]
    }
    
    init(product: Product) {
        if (product.orderDetail.temperature == .iceOnly) {
            self.hotButton = MultiStateButton(state: .block, title: "HOT", color: .hot)
            self.iceButton = MultiStateButton(state: .selected, title: "ICE", color: .ice)
        } else {
            self.hotButton = MultiStateButton(state: .selected, title: "HOT", color: .hot)
            self.iceButton = MultiStateButton(state: .unselected, title: "ICE", color: .ice)
        }
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
        self.spacing = 10
        
        self.arrangedViews.forEach {
            self.addArrangedSubview($0)
        }
    }
    
    func update() {
        self.hotButton.changeButtonState()
        self.iceButton.changeButtonState()
    }
}
