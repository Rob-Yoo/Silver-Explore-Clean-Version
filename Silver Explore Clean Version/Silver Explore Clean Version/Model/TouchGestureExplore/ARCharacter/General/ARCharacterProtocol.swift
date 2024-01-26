//
//  ARCharacter.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/25/24.
//

import ARKit

protocol RotationActionProtocol: RightAngleRotationActionProtocol, EulerAngleRotationActionProtocol, ZAxisRotationActionProtocol {}

protocol ARCharacterActionProtocol: JumpActionProtocol, HighJumpActionProtocol, ScaleActionProtocol, RotationActionProtocol {
    func setScneneView(sceneView: ARSCNView)
    func resetAngle()
    func resetScale()
}

protocol ARCharacterProtocol: ARCharacterActionProtocol {
    static func makeContainerNode() -> SCNNode?
}
