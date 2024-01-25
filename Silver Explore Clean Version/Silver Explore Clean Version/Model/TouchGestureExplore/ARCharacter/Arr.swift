//
//  Arr.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/25/24.
//

import UIKit
import ARKit

class Arr {
    private var objectData: ARObjectData
    private var eulerAngleOfCharacterNode: SCNVector3
    private var longPressStartTime: CFTimeInterval = 0.0
    private var initialScale: CGFloat
    private var updatedScale: CGFloat = 0.0
    
    init(containerNode: SCNNode) {
        self.objectData = ARObjectData(characterContainerNode: containerNode, characterNodeName: String(describing: Arr.self))
        self.eulerAngleOfCharacterNode = self.objectData.characterNode.eulerAngles
        self.initialScale = CGFloat(self.objectData.characterNode.scale.x)
    }
    
    static func makeContainerNode() -> SCNNode? {
        let node: SCNNode = SCNNode()

        guard let arrScene = SCNScene(named: "art.scnassets/Arr/Arr.scn") else {
            return nil
        }
        guard let arrNode = arrScene.rootNode.childNode(withName: "Arr", recursively: true) else {
            return nil
        }

        arrNode.transform = SCNMatrix4MakeRotation(-GLKMathDegreesToRadians(30), 1, 0, 0)
        arrNode.scale = SCNVector3(0.00002, 0.00002, 0.00002)
        
        node.addChildNode(arrNode)
        return node
    }
}

//MARK: - Action Methods Implementation
extension Arr: ARCharacter {
    func jump() {
        let jumpAction = SCNAction.moveBy(x: 0, y: 0.03, z: 0, duration: 0.2)
        let fallAction = SCNAction.moveBy(x: 0, y: -0.03, z: 0, duration: 0.2)
        let jumpSequence = SCNAction.sequence([jumpAction, fallAction])

        self.objectData.characterNode.runAction(jumpSequence)
    }
    
    func highJump(_ gesture: UILongPressGestureRecognizer) {
        if (gesture.state == .began) {
            readyAction()
            longPressStartTime = CACurrentMediaTime()
        } else if (gesture.state == .ended) {
            let longPressEndTime = CACurrentMediaTime()
            let longPressDuration = longPressEndTime - longPressStartTime
            highJumpAction(longPressDuration: longPressDuration)
        }

        func readyAction() {
            let scaleAction = SCNAction.customAction(duration: 0.0) {
                (_, _) in
                self.objectData.characterNode.scale = SCNVector3(self.initialScale, self.initialScale - 0.000003, self.initialScale)
            }
            self.objectData.characterNode.runAction(scaleAction)
        }

        func highJumpAction(longPressDuration: CFTimeInterval) {
            let scaleAction = SCNAction.customAction(duration: 0.0) {
                (_, _) in
                self.objectData.characterNode.scale = SCNVector3(0.00002, 0.00002, 0.00002)
            }
            let jumpHeight = CGFloat(longPressDuration) * 0.1
            let jumpAction = SCNAction.moveBy(x: 0, y: jumpHeight, z: 0, duration: 0.2)
            let fallAction = SCNAction.moveBy(x: 0, y: -jumpHeight, z: 0, duration: 0.2)
            let jumpSequence = SCNAction.sequence([scaleAction, jumpAction, fallAction])

            self.objectData.characterNode.runAction(jumpSequence)
        }
    }

    func scaleUpAndDown(_ gesture: UIPinchGestureRecognizer) {
        switch gesture.state {
        case .began:
            updatedScale = CGFloat(self.objectData.characterNode.scale.x)
        case .changed:
            let scale = gesture.scale
            let scaleValue = updatedScale * scale
            let scaleAction = SCNAction.scale(to: scaleValue, duration: 0.0)

            self.objectData.characterNode.runAction(scaleAction)
        default:
            return
        }
    }
    
    func rightAngleRotate(_ gesture: UISwipeGestureRecognizer) {
        var rightAngleRotatingAction: SCNAction!

        switch gesture.direction {
        case .right:
            rightAngleRotatingAction = SCNAction.rotateBy(x: 0.0, y: CGFloat(GLKMathDegreesToRadians(90)) , z: 0.0, duration: 0.2)
        case .left:
            rightAngleRotatingAction = SCNAction.rotateBy(x: 0.0, y: -CGFloat(GLKMathDegreesToRadians(90)) , z: 0.0, duration: 0.2)
        case .up:
            rightAngleRotatingAction = SCNAction.rotateBy(x: -CGFloat(GLKMathDegreesToRadians(90)), y: 0.0 , z: 0.0, duration: 0.2)
        case .down:
            rightAngleRotatingAction = SCNAction.rotateBy(x: CGFloat(GLKMathDegreesToRadians(90)), y: 0.0 , z: 0.0, duration: 0.2)
        default:
            return
        }

        self.objectData.characterNode.runAction(rightAngleRotatingAction)
    }
    
    func eulerAngleRotate(_ gesture: UIPanGestureRecognizer) {
        if (gesture.state == .ended || gesture.state == .cancelled) {
            resetARCharacterAngle(targetNode: self.objectData.characterNode)
        } else {
            let translation = gesture.translation(in: self.objectData.sceneView)
            let rotationAngleX = CGFloat(translation.x) * 0.001
            let rotationAngleY = CGFloat(translation.y) * 0.001
            let yRotation = SCNAction.rotateBy(x: 0, y: rotationAngleX, z: 0, duration: 0)
            let xRotation = SCNAction.rotateBy(x: rotationAngleY, y: 0, z: 0, duration: 0)
            
            self.objectData.characterNode.runAction(yRotation)
            self.objectData.characterNode.runAction(xRotation)
        }
    }
    
    func zAxisRotate(_ gesture: UIRotationGestureRecognizer) {
        if (gesture.state == .changed) {
            let rotationAngle = gesture.rotation
            let degrees = -GLKMathRadiansToDegrees(Float(rotationAngle) * 0.005)
            let rotationAction = SCNAction.rotateBy(x: 0, y: 0, z: CGFloat(degrees), duration: 0.0)
            self.objectData.characterNode.runAction(rotationAction)
        }
    }
    
    func resetARCharacterAngle(targetNode: SCNNode) {
        let resetAngleAction = SCNAction.rotateTo(x: CGFloat(eulerAngleOfCharacterNode.x), y: CGFloat(eulerAngleOfCharacterNode.y), z: CGFloat(eulerAngleOfCharacterNode.z), duration: 0.2)
        
        targetNode.runAction(resetAngleAction)
    }
    
    func resetARCharacterScale() {
        let resetScaleAction = SCNAction.customAction(duration: 0.2) { (_, _) in
            self.objectData.characterNode.scale = SCNVector3(self.initialScale, self.initialScale, self.initialScale)
        }
        
        self.objectData.characterNode.runAction(resetScaleAction)
    }
}
