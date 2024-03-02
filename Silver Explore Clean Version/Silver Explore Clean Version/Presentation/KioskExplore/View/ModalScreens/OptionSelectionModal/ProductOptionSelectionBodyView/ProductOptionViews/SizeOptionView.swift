//
//  SizeOptionView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 3/2/24.
//

import UIKit

final class SizeOptionView: UIView {
    private(set) var optionNameLabel = {
        let label = UILabel()
        
        label.text = "사이즈"
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    private(set) var sizeOptionSelectionStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        self.configureOptionNameLabel()
        self.configureSizeOptionSelectionStackView()
    }
    
    private func configureOptionNameLabel() {
        self.addSubview(self.optionNameLabel)
        
        self.optionNameLabel
            .leadingAnchor(self.leadingAnchor, padding: 10)
            .centerYAnchor(self.centerYAnchor)
    }
    
    private func configureSizeOptionSelectionStackView() {
        self.addSubview(self.sizeOptionSelectionStackView)
        
        self.sizeOptionSelectionStackView
            .widthAnchor(self.widthAnchor, multiplier: 0.8)
            .centerXAnchor(self.centerXAnchor)
            .centerYAnchor(self.centerYAnchor)
    }
}

final class SizeOptionSelectionStackView: UIStackView {
    // TODO: - 각각이 버튼이 아닌 UIView여야 함
    private(set) var regularOptionButton = OptionSelectionButton(productOptionName: "레귤러")
    private(set) var grandeOptionButton = OptionSelectionButton(productOptionName: "그란데")
    private(set) var ventiOptionButton = OptionSelectionButton(productOptionName: "벤티")
    private var arrangedViews: [UIView] {
        return [regularOptionButton, grandeOptionButton, ventiOptionButton]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
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
}
