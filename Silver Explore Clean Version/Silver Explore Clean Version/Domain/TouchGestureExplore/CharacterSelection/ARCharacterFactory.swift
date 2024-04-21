//
//  ARCharacterFactory.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/7/24.
//

import SceneKit

protocol ARCharacterCreator {
    func createARCharacter() -> ARCharacterProtocol
}

struct ARCharacterFactory {
    static func createARCharacter(_ arCharacterCreator: ARCharacterCreator) -> ARCharacterProtocol {
        return arCharacterCreator.createARCharacter()
    }
}

struct ArrCreator: ARCharacterCreator {
    func createARCharacter() -> ARCharacterProtocol {
        let containerNode: SCNNode = SCNNode()

        guard let arrScene = SCNScene(named: "art.scnassets/Arr/Arr.scn") else {
            fatalError("Arr의 SCNScene 이름이 올바른지 확인해주세요.")
        }
        guard let arrNode = arrScene.rootNode.childNode(withName: "Arr", recursively: true) else {
            fatalError("Arr의 SCNNode 이름이 올바른지 확인해주세요.")
        }

        arrNode.transform = SCNMatrix4MakeRotation(-GLKMathDegreesToRadians(30), 1, 0, 0)
        arrNode.scale = SCNVector3(0.00002, 0.00002, 0.00002)
        
        containerNode.addChildNode(arrNode)
        return Arr(containerNode: containerNode)
    }
}

struct FinnCreator: ARCharacterCreator {
    func createARCharacter() -> ARCharacterProtocol {
        let containerNode: SCNNode = SCNNode()
        
        guard let finnScene = SCNScene(named: "art.scnassets/Finn/Finn.scn") else {
            fatalError("Finn의 SCNScene 이름이 올바른지 확인해주세요.")
        }
      
        guard let finnNode = finnScene.rootNode.childNode(withName: "Finn", recursively: true) else {
            fatalError("Finn의 SCNNode 이름이 올바른지 확인해주세요.")
        }
        
        finnNode.transform = SCNMatrix4MakeRotation(-GLKMathDegreesToRadians(100), 1, 0, 0)
        finnNode.scale = SCNVector3(0.0009, 0.0007, 0.0007)
        
        containerNode.addChildNode(finnNode)
        return Finn(containerNode: containerNode)
    }
}
