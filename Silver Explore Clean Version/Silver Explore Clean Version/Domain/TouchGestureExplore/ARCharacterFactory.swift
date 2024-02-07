//
//  ARCharacterFactory.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/7/24.
//

import ARKit

protocol ARCharacterCreator {
    func createARCharacter() -> ARCharacterProtocol
}

struct ARCharacterFactory {
    static func createARCharcter(_ arCharacterCreator: ARCharacterCreator) -> ARCharacterProtocol {
        return arCharacterCreator.createARCharacter()
    }
}

struct ArrCreator: ARCharacterCreator {
    func createARCharacter() -> ARCharacterProtocol {
        guard let containerNode = Arr.makeContainerNode() else {
            fatalError("Arr의 SCNNode 관련 설정이 올바르지 않습니다.")
        }
        
        return Arr(containerNode: containerNode)
    }
}

struct FinnCreator: ARCharacterCreator {
    func createARCharacter() -> ARCharacterProtocol {
        guard let containerNode = Finn.makeContainerNode() else {
            fatalError("Finn의 SCNNode 관련 설정이 올바르지 않습니다.")
        }
        
        return Finn(containerNode: containerNode)
    }
}
