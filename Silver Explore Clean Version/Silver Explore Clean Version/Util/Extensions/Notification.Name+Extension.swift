//
//  Notification.Name+Extension.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 4/17/24.
//

import Foundation

extension Notification.Name {
    static let HomeViewUserAction = Notification.Name(rawValue: "HomeViewUserAction")
    static let CharacterSelectionViewUserAction = Notification.Name(rawValue: "CharacterSelectionViewUserAction")
    static let ARSceneViewUserAction = Notification.Name(rawValue: "ARSceneViewUserAction")
    static let OrderDetailViewUserAction = Notification.Name(rawValue: "OrderDetailViewUserAction")
    static let OrderDetailChanged = Notification.Name(rawValue: "OrderDetailChanged")
}
