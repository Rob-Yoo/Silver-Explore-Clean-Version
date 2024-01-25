//
//  ARCharacterProtocol.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/25/24.
//

import ARKit

struct ARObjectData {
    var sceneView: ARSCNView = .init(frame: .zero)
    let characterContainerNode: SCNNode
    let characterNode: SCNNode
    
    init(characterContainerNode: SCNNode, characterNodeName: String) {
        self.characterContainerNode = characterContainerNode
        self.characterNode = characterContainerNode.childNode(withName: characterNodeName, recursively: true)!
    }
    
    mutating func setSceneView(sceneView: ARSCNView) { self.sceneView = sceneView }
}
