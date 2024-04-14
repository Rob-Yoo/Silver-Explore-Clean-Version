//
//  ProductOptionStackView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/2/24.
//

import UIKit

final class ProductOptionStackView: UIStackView {
    private(set) var temperatureOptionView: TemperatureOptionView
    private(set) var sizeOptionView =  {
        let view = UIView()
        view.backgroundColor = .silverLight
        return view
    }()
    
    private(set) lazy var iceQuantityOptionView = {
        let view = UIView()
        view.backgroundColor = .silverLight
        return view
    }()
    
    private var arrangedViews: [UIView] {
        return [temperatureOptionView, sizeOptionView, iceQuantityOptionView]
    }
    
    init(product: Product) {
        self.temperatureOptionView = TemperatureOptionView(product: product)
        super.init(frame: .zero)
        self.configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fillEqually
        self.spacing = 10
        self.arrangedViews.forEach {
            self.addArrangedSubview($0)
        }
//        
//        self.configureTemperatureOptionView()
//        self.configureSizeOptionView()
//        self.configureIceQuantityOptionView()
    }
//    
//    private func configureTemperatureOptionView() {
//        self.addArrangedSubview(self.temperatureOptionView)
//        
//        self.temperatureOptionView
//            .widthAnchor(self.widthAnchor, multiplier: 0.7)
//            .centerXAnchor(self.centerXAnchor)
//    }
//    
//    private func configureSizeOptionView() {
//        self.addArrangedSubview(self.sizeOptionView)
//        
//        self.sizeOptionView
//            .leadingAnchor(self.leadingAnchor, padding: 5)
//            .widthAnchor(self.widthAnchor, multiplier: 0.9)
//    }
//    
//    private func configureIceQuantityOptionView() {
//        self.addArrangedSubview(self.iceQuantityOptionView)
//        
//        self.iceQuantityOptionView
//            .leadingAnchor(self.leadingAnchor, padding: 5)
//            .widthAnchor(self.widthAnchor, multiplier: 0.9)
//    }
}
