//
//  ARCharacter.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/25/24.
//

import ARKit

protocol RotationActionProtocol: RightAngleRotationActionProtocol, EulerAngleRotationActionProtocol, ZAxisRotationActionProtocol {}

protocol ARCharacterProtocol: ARObjectProtocol, JumpActionProtocol, HighJumpActionProtocol, ScaleActionProtocol, RotationActionProtocol {
    func resetAngle()
    func resetScale()
}
