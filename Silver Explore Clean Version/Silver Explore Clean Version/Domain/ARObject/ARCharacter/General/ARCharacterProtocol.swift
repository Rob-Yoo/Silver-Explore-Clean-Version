//
//  ARCharacter.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/25/24.
//

import ARKit

protocol RotationActionProtocol: RightAngleRotationActionProtocol, EulerAngleRotationActionProtocol, ZAxisRotationActionProtocol {}

protocol ARCharacterProtocol: JumpActionProtocol, HighJumpActionProtocol, ScaleActionProtocol, RotationActionProtocol {
    static func makeContainerNode() -> SCNNode?
    func getContainerNode() -> SCNNode?
    func setScneneView(sceneView: ARSCNView)
    func resetAngle()
    func resetScale()
}
