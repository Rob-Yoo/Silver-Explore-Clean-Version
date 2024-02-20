//
//  ExploreStageDescriptionStackView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/16/24.
//

import UIKit

final class BlurredExploreStageDescriptionView: UIVisualEffectView {
    private(set) var exploreStageDescriptionStackView = ExploreStageDescriptionStackView()
    
    override init(effect: UIVisualEffect?) {
        super.init(effect: effect)
        self.configure()
    }
    
    private func configure() {
        self.contentView.addSubview(self.exploreStageDescriptionStackView)
        
        self.exploreStageDescriptionStackView.widthAnchor(self.widthAnchor)
            .heightAnchor(self.heightAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ image: UIImage, _ description: String) {
        self.exploreStageDescriptionStackView.update(image, description)
    }
}

final class ExploreStageDescriptionStackView: UIStackView {
    private(set) var descriptionImageView = DescriptionImageView()
    private(set) var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "한 손가락을 사용해\nAR 캐릭터를 한번 탭해보세요!"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private let exploreStartLabel: UILabel = {
        let label = UILabel()
        
        label.text = "터치하여 시작하기"
        label.font = .systemFont(ofSize: 35)
        label.textAlignment = .center
        label.textColor = .white
        
        return label
    }()
    
    private let lineView: UIView = {
        let line = UIView()
        line.backgroundColor = .white
        return line
    }()
    
    private var descriptionViews: [UIView] {
        return [self.descriptionImageView, self.descriptionLabel, self.exploreStartLabel]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fillEqually
        self.descriptionViews.forEach {
            self.addArrangedSubview($0)
        }
        
        self.configureLineView()
    }
    
    private func configureLineView() {
        guard let lastView = self.arrangedSubviews.last else { return }
        
        lastView.addSubview(self.lineView)
        self.lineView
            .topAnchor(lastView.topAnchor)
            .widthAnchor(lastView.widthAnchor)
            .heightAnchor(equalToConstant: 1)
    }
    
    func update(_ image: UIImage, _ description: String) {
        self.descriptionLabel.text = description
        self.descriptionImageView.update(image)
    }
}

final class DescriptionImageView: UIView {
    private(set) var imageView = UIImageView(image: .tap)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.addSubview(self.imageView)
        self.imageView.contentMode = .scaleAspectFit
        self.imageView
            .widthAnchor(self.widthAnchor, multiplier: 0.5)
            .heightAnchor(self.heightAnchor, multiplier: 0.8)
            .centerXAnchor(self.centerXAnchor)
            .centerYAnchor(self.centerYAnchor)
    }
    
    func update(_ image: UIImage) {
        self.imageView.image = image
    }
}
