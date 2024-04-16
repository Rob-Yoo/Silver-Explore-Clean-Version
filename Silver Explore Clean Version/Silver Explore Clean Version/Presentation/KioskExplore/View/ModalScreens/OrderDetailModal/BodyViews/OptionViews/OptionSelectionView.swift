//
//  ProductOptionStackView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/2/24.
//

import UIKit

final class OptionSelectionView: UIView {
    private(set) var temperatureOptionView: TemperatureOptionView

    private(set) var sizeOptionLabel = TextLabel(text: "사이즈").font(.systemFont(ofSize: 20, weight: .regular))
    private(set) var sizeOptionSegmentedControl: SegmentedControl

    private(set) var iceQunatityOptionLabel = TextLabel(text: "얼음").font(.systemFont(ofSize: 20, weight: .regular))
    private(set) var iceQuantityOptionSegmentedControl: SegmentedControl

    init(temperature: Temperature, size: Size = .regular, iceQuantity: IceQuantity = .regular) {
        self.temperatureOptionView = TemperatureOptionView(temperature: temperature)
        self.sizeOptionSegmentedControl = SegmentedControl(items: ["레귤러", "그란데", "벤티"], defaultIndex: size.rawValue)
        self.iceQuantityOptionSegmentedControl = SegmentedControl(items: ["적게", "보통", "많게"], defaultIndex: iceQuantity.rawValue)

        super.init(frame: .zero)
        self.configure(temperature: temperature)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(temperature: Temperature) {
        self.configureTemperatureOptionView()
        self.configureSizeOptionSegmentedControl()
        
        if (temperature != .iceOnly) {
            self.configureIceQuantityOptionSegmentedControl()
        }
    }
    
    private func configureTemperatureOptionView() {
        self.addSubview(self.temperatureOptionView)
        
        self.temperatureOptionView
            .topAnchor(self.topAnchor)
            .widthAnchor(self.widthAnchor)
            .heightAnchor(self.heightAnchor, multiplier: 0.2)
    }
    
    private func configureSizeOptionSegmentedControl() {
        self.addSubview(self.sizeOptionSegmentedControl)
        self.addSubview(self.sizeOptionLabel)
        
        self.sizeOptionSegmentedControl
            .topAnchor(self.temperatureOptionView.bottomAnchor, padding: 50)
            .widthAnchor(self.widthAnchor)
            .heightAnchor(equalToConstant: 70)
        
        self.sizeOptionLabel
            .trailingAnchor(self.sizeOptionSegmentedControl.leadingAnchor, padding: -25)
            .centerYAnchor(self.sizeOptionSegmentedControl.centerYAnchor)
    }
    
    
    private func configureIceQuantityOptionSegmentedControl() {
        self.addSubview(self.iceQuantityOptionSegmentedControl)
        self.addSubview(self.iceQunatityOptionLabel)
        
        self.iceQuantityOptionSegmentedControl
            .topAnchor(self.sizeOptionSegmentedControl.bottomAnchor, padding: 40)
            .widthAnchor(self.widthAnchor)
            .heightAnchor(equalToConstant: 70)
        
        self.iceQunatityOptionLabel
            .trailingAnchor(self.iceQuantityOptionSegmentedControl.leadingAnchor, padding: -25)
            .centerYAnchor(self.iceQuantityOptionSegmentedControl.centerYAnchor)
    }
    
    func update(temperature: Temperature) {
        self.temperatureOptionView.update()

        if (temperature == .hot) {
            self.iceQunatityOptionLabel.isHidden = true
            self.iceQuantityOptionSegmentedControl.isHidden = true
        } else if (temperature == .ice) {
            self.iceQunatityOptionLabel.isHidden = false
            self.iceQuantityOptionSegmentedControl.isHidden = false
        }
    }
}
