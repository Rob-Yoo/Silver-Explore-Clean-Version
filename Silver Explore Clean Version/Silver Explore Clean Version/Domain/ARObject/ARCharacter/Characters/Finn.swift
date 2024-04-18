//
//  Finn.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/26/24.
//

import UIKit
import ARKit

final class Finn: ARCharacterProtocol {
    private var objectData: ARObjectData
    private var actionData: ARCharacterActionData
    
    init(containerNode: SCNNode) {
        let initialEulerAngle: SCNVector3
        let initialScale: SCNVector3
        
        self.objectData = ARObjectData(characterContainerNode: containerNode, characterNodeName: String(describing: Finn.self))
        initialEulerAngle = self.objectData.characterNode.eulerAngles
        initialScale = self.objectData.characterNode.scale
        self.actionData = ARCharacterActionData(initialEulerAngle: initialEulerAngle, initialScale: initialScale)
    }
    
    func getContainerNode() -> SCNNode? {
        return self.objectData.characterContainerNode
    }
    
    static func makeContainerNode() -> SCNNode? {
        let node: SCNNode = SCNNode()
        
        guard let finnScene = SCNScene(named: "art.scnassets/Finn/Finn.scn") else {
            return nil
        }
      
        guard let finnNode = finnScene.rootNode.childNode(withName: "Finn", recursively: true) else {
            return nil
        }
        
        finnNode.transform = SCNMatrix4MakeRotation(-GLKMathDegreesToRadians(100), 1, 0, 0)
        finnNode.scale = SCNVector3(0.0009, 0.0007, 0.0007)
        
        node.addChildNode(finnNode)
        
        return node
    }
    
    func setSceneView(sceneView: ARSCNView) {
        self.objectData.setSceneView(sceneView: sceneView)
    }
}

//MARK: - Action Methods Implementation
extension Finn {
    func jump() {
        let jumpAction = SCNAction.moveBy(x: 0, y: 0.03, z: 0, duration: 0.2)
        let fallAction = SCNAction.moveBy(x: 0, y: -0.03, z: 0, duration: 0.2)
        
        let jumpSequence = SCNAction.sequence([jumpAction, fallAction])
        
        self.objectData.characterNode.runAction(jumpSequence)
    }
    
    func highJump(_ gesture: UILongPressGestureRecognizer) {
        if (gesture.state == .began) {
            readyAction()
            self.actionData.longPressStartTime = CACurrentMediaTime()
        } else if (gesture.state == .ended) {
            let longPressEndTime = CACurrentMediaTime()
            let longPressDuration = longPressEndTime - self.actionData.longPressStartTime
            highJumpAction(longPressDuration: longPressDuration)
        }
        
        func readyAction() {
            let scaleAction = SCNAction.customAction(duration: 0.0) {
                [weak self] (_, _) in
                guard let initialScale = self?.actionData.initialScale else { return }

                self?.objectData.characterNode.scale = SCNVector3(initialScale.x, initialScale.y, initialScale.z - 0.0002)
            }

            self.objectData.characterNode.runAction(scaleAction)
        }
        
        func highJumpAction(longPressDuration: CFTimeInterval) {
            let scaleAction = SCNAction.customAction(duration: 0.0) {
                [weak self] (_, _) in
                guard let initialScale = self?.actionData.initialScale else { return }

                self?.objectData.characterNode.scale = initialScale
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
            self.actionData.updatedScale = CGFloat(self.objectData.characterNode.scale.x)
        case .changed:
            let scale = gesture.scale
            let scaleValue = self.actionData.updatedScale * scale
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
            break
        case .left:
            rightAngleRotatingAction = SCNAction.rotateBy(x: 0.0, y: -CGFloat(GLKMathDegreesToRadians(90)) , z: 0.0, duration: 0.2)
            break
        case .up:
            rightAngleRotatingAction = SCNAction.rotateBy(x: -CGFloat(GLKMathDegreesToRadians(90)), y: 0.0 , z: 0.0, duration: 0.2)
            break
        default:
            rightAngleRotatingAction = SCNAction.rotateBy(x: CGFloat(GLKMathDegreesToRadians(90)), y: 0.0 , z: 0.0, duration: 0.2)
        }

        self.objectData.characterNode.runAction(rightAngleRotatingAction)
    }
    
    func eulerAngleRotate(_ gesture: UIPanGestureRecognizer) {
        if (gesture.state == .ended || gesture.state == .cancelled) {
            resetAngle()
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
    
    func resetAngle() {
        let initialEulerAngles = self.actionData.initialEulerAngle
        let resetAngleAction = SCNAction.rotateTo(x: CGFloat(initialEulerAngles.x), y: CGFloat(initialEulerAngles.y), z: CGFloat(initialEulerAngles.z), duration: 0.2)
        
        self.objectData.characterNode.runAction(resetAngleAction)
    }
    
    func resetScale() {
        let resetScaleAction = SCNAction.customAction(duration: 0.2) { [weak self] (_, _) in
            guard let initialScale = self?.actionData.initialScale else { return }

            self?.objectData.characterNode.scale = initialScale
        }
        
        self.objectData.characterNode.runAction(resetScaleAction)
    }
}
