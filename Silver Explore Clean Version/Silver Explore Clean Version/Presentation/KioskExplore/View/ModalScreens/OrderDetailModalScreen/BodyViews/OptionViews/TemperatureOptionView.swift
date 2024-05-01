//
//  TemparatureOptionView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/2/24.
//

import UIKit

final class TemperatureOptionView: UIStackView {
    private var temperature: Temperature

    private(set) var hotButton: MultiStateButton
    private(set) var iceButton: MultiStateButton
    private var arrangedViews: [UIView] {
        return [hotButton, iceButton]
    }
    
    init(temperature: Temperature) {
        if (temperature == .iceOnly) {
            self.temperature = .ice
            self.hotButton = MultiStateButton(state: .block, title: "HOT", color: .hot)
            self.iceButton = MultiStateButton(state: .selected, title: "ICE", color: .ice)
        } else {
            self.temperature = .hot
            self.hotButton = MultiStateButton(state: .selected, title: "HOT", color: .hot)
            self.iceButton = MultiStateButton(state: .unselected, title: "ICE", color: .ice)
        }

        super.init(frame: .zero)

        self.configure()
        NotificationCenter.default.addObserver(self, selector: #selector(self.addUserAction(notification:)), name: .OrderDetailViewUserAction, object: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .OrderDetailViewUserAction, object: nil)
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
    
    @objc private func addUserAction(notification: Notification) {
        guard let delegate = notification.object as? OrderDetailModalViewDelegate else {
            fatalError("TemperatureOptionView: 잘못된 Object가 Post 되었습니다!")
        }
        
        self.hotButton.addTarget(delegate, action: #selector(delegate.hotButtonTapped), for: .touchUpInside)
        self.iceButton.addTarget(delegate, action: #selector(delegate.iceButtonTapped), for: .touchUpInside)
    }
    
    func update(temperature: Temperature) {
        var inputTemperature: Temperature
        
        if (temperature == .iceOnly) {
            inputTemperature = .ice
        } else {
            inputTemperature = temperature
        }
        
        if (inputTemperature != self.temperature) {
            self.temperature = inputTemperature
            self.hotButton.changeButtonState()
            self.iceButton.changeButtonState()            
        }
    }
}
