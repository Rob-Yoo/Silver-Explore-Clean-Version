//
//  ARCharcterViewController.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/7/24.
//

import UIKit

class ARCharcterViewController: UIViewController {

    private let arCharacter: ARCharacterProtocol
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(arCharacter: ARCharacterProtocol) {
        self.arCharacter = arCharacter
        super.init(nibName: nil, bundle: nil)
        
        print(self.arCharacter)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
