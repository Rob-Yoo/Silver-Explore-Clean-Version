//
//  ExploreContentFactory.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/25/24.
//

import UIKit

struct ExploreContentFactory {
    static func createExploreContentVC(content: Content) -> UIViewController? {
        switch content {
        case .TouchGestureExplore:
            return ARCharacterSelectionViewController()
        case .KioskExplore:
            return KioskViewController()
        case .AIExplore:
            return AIExploreViewController()
        case .none:
            return nil
        }
    }
}
