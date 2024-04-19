//
//  ExploreStageDescriptionView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 4/20/24.
//

import UIKit

final class ExploreStageDescriptionStackView: UIStackView {
    private(set) var descriptionImageView: DescriptionImageView
    private(set) var descriptionLabel: UILabel = {
        let label = UILabel()

        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private(set) var exploreStartLabel: UILabel = {
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
    
    init(image: UIImage, description: String) {
        self.descriptionImageView = DescriptionImageView(image: image)
        self.descriptionLabel.text = description
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
