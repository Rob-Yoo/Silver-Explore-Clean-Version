//
//  ARCharacter.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/25/24.
//

import ARKit

protocol RotationActionProtocol: RightAngleRotationActionProtocol, EulerAngleRotationActionProtocol, ZAxisRotationActionProtocol {}

protocol ARCharacter: JumpActionProtocol, HighJumpActionProtocol, ScaleActionProtocol, RotationActionProtocol {
    func resetARCharacterAngle(targetNode: SCNNode)
    func resetARCharacterScale()
}
