//
//  ARCharacterActionData.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/26/24.
//

import ARKit

struct ARCharacterActionData {
    let initialEulerAngle: SCNVector3
    let initialScale: CGFloat
    var updatedScale: CGFloat = 0.0
    var longPressStartTime: CFTimeInterval = 0
}
