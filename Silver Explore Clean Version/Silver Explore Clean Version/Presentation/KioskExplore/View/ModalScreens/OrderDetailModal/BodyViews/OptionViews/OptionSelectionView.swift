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
    private(set) var sizeOptionSegmentedControl = SegmentedControl(items: ["레귤러", "그란데", "벤티"])

    private(set) var iceQunatityOptionLabel = TextLabel(text: "얼음").font(.systemFont(ofSize: 20, weight: .regular))
    private(set) lazy var iceQuantityOptionSegmentedControl = SegmentedControl(items: ["적게", "보통", "많게"], defaultIndex: 1)

    init(product: Product) {
        self.temperatureOptionView = TemperatureOptionView(product: product)
        super.init(frame: .zero)
        self.configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.configureTemperatureOptionView()
        self.configureIceQuantityOptionSegmentedControl()
        self.configureSizeOptionSegmentedControl()
    }
    
    private func configureTemperatureOptionView() {
        self.addSubview(self.temperatureOptionView)
        
        self.temperatureOptionView
            .topAnchor(self.topAnchor)
            .widthAnchor(self.widthAnchor)
            .heightAnchor(self.heightAnchor, multiplier: 0.2)
    }
    
    private func configureIceQuantityOptionSegmentedControl() {
        self.addSubview(self.iceQuantityOptionSegmentedControl)
        self.addSubview(self.iceQunatityOptionLabel)
        
        self.iceQuantityOptionSegmentedControl
            .bottomAnchor(self.bottomAnchor, padding: -30)
            .widthAnchor(self.widthAnchor)
            .size(.init(width: 0, height: 70))
        
        self.iceQunatityOptionLabel
            .trailingAnchor(self.iceQuantityOptionSegmentedControl.leadingAnchor, padding: -25)
            .centerYAnchor(self.iceQuantityOptionSegmentedControl.centerYAnchor)
    }

    private func configureSizeOptionSegmentedControl() {
        self.addSubview(self.sizeOptionSegmentedControl)
        self.addSubview(self.sizeOptionLabel)
        
        self.sizeOptionSegmentedControl
            .bottomAnchor(self.iceQuantityOptionSegmentedControl.topAnchor, padding: -30)
            .widthAnchor(self.widthAnchor)
            .size(.init(width: 0, height: 70))
        
        self.sizeOptionLabel
            .trailingAnchor(self.sizeOptionSegmentedControl.leadingAnchor, padding: -25)
            .centerYAnchor(self.sizeOptionSegmentedControl.centerYAnchor)
    }
    
}
