//
//  ContentOnboardingViewController.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/18/24.
//

import UIKit

class ContentOnboardingViewController: UIViewController {

    lazy var label = {
        let l = UILabel()
        l.text = "hi"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    private let exploreContent: ExploreContent.Content
    
    init(selectedContent: ExploreContent.Content) {
        self.exploreContent = selectedContent
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
}
