//
//  ARKioskForCreditCard.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 4/18/24.
//

import ARKit
import SceneKit

class ARKioskForCreditCard: ARKioskProtocol {
    private var objectData: ARObjectData
    private var updatedScale: CGFloat = 0.0
    
    init(containerNode: SCNNode) {
        self.objectData = ARObjectData(characterContainerNode: containerNode, characterNodeName: String(describing: ARKioskForCreditCard.self))
    }
    
    static func makeContainerNode() -> SCNNode? {
        let node: SCNNode = SCNNode()

        guard let scene = SCNScene(named: "art.scnassets/ARKioskForCreditCard/ARKioskForCreditCard.scn") else {
            return nil
        }
        guard let kioskNode = scene.rootNode.childNode(withName: "ARKioskForCreditCard", recursively: true) else {
            return nil
        }
        
        kioskNode.scale = SCNVector3(0.05, 0.05, 0.09)
        
        node.addChildNode(kioskNode)
        return node
    }
    
    func getContainerNode() -> SCNNode? {
        return self.objectData.characterContainerNode
    }
    
    func setSceneView(sceneView: ARSCNView) {
        self.objectData.setSceneView(sceneView: sceneView)
    }
}

extension ARKioskForCreditCard {
    func rightAngleRotate(_ gesture: UISwipeGestureRecognizer) {
        var rightAngleRotatingAction: SCNAction!

        switch gesture.direction {
        case .right:
            rightAngleRotatingAction = SCNAction.rotateBy(x: 0.0, y: CGFloat(GLKMathDegreesToRadians(90)) , z: 0.0, duration: 0.2)
        case .left:
            rightAngleRotatingAction = SCNAction.rotateBy(x: 0.0, y: -CGFloat(GLKMathDegreesToRadians(90)) , z: 0.0, duration: 0.2)
        default:
            return
        }

        self.objectData.characterNode.runAction(rightAngleRotatingAction)
    }
    
    func scaleUpAndDown(_ gesture: UIPinchGestureRecognizer) {
        switch gesture.state {
        case .began:
            self.updatedScale = CGFloat(self.objectData.characterNode.scale.x)
        case .changed:
            let scale = gesture.scale
            let scaleValue = self.updatedScale * scale
            let scaleAction = SCNAction.scale(to: scaleValue, duration: 0.0)
            
            self.objectData.characterNode.runAction(scaleAction)
        default:
            return
        }
    }
}

