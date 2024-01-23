//
//  ConcreteFactories.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/23/24.
//

import UIKit

struct TouchGestureExploreCreator: ExploreContentFactory {
    func createExploreContentVC() -> UIViewController {
        return TouchGestureExploreViewController()
    }
}

struct KioskExploreCreator: ExploreContentFactory {
    func createExploreContentVC() -> UIViewController {
        return KioskViewController()
    }
}

struct AIExploreCreator: ExploreContentFactory {
    func createExploreContentVC() -> UIViewController {
        return AIExploreViewController()
    }
}
