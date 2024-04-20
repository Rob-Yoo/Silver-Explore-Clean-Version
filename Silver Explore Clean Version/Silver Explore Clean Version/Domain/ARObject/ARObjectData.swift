//
//  ARCharacterProtocol.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/25/24.
//

import ARKit

struct ARObjectData {
    var sceneView: ARSCNView = .init(frame: .zero)
    let objectContainerNode: SCNNode
    let objectNode: SCNNode
    
    init(characterContainerNode: SCNNode, characterNodeName: String) {
        self.objectContainerNode = characterContainerNode
        self.objectNode = characterContainerNode.childNode(withName: characterNodeName, recursively: true)!
    }
    
    mutating func setSceneView(sceneView: ARSCNView) { self.sceneView = sceneView }
}
