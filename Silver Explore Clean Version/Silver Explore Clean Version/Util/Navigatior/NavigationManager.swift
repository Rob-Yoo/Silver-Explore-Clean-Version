//
//  NavigationManager.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/21/24.
//

import UIKit

class NavigationManager {
    static let shared = NavigationManager()
    private var navigationController: UINavigationController?
    
    private init() {}
    
    func addNavigationController(_ navigationController: UINavigationController) {
        if self.navigationController == nil {
            self.navigationController = navigationController
        }
    }
    
    func push(_ viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func presentModal(_ viewController: UIViewController) {
        viewController.modalPresentationStyle = .overFullScreen
        self.navigationController?.topViewController?.present(viewController, animated: false)
    }
    
    func pop() {
        self.navigationController?.popViewController(animated: true)
    }
}
