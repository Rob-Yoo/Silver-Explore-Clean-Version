//
//  ARObjectProtocol.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 4/18/24.
//

import ARKit

protocol ARObjectProtocol {
    func getContainerNode() -> SCNNode?
    func setSceneView(sceneView: ARSCNView)
}
