//
//  TouchGestureExploreModel.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/17/24.
//

import ARKit
import Combine

class TouchGestureExploreModel {
    @Published var stage: ExploreStage
    @Published var isFinish: Bool = false
    private(set) var arCharacter: ARCharacterProtocol
    
    init(arCharacter: ARCharacterProtocol) {
        self.arCharacter = arCharacter
        self.stage = TapStage(arCharacter: self.arCharacter)
    }
    
    func getContainerNodeOfARCharacter() -> SCNNode? {
        return self.arCharacter.getContainerNode()
    }
    
    func moveNextStage(_ context: TouchGestureExploreModel) {
        stage.nextStage(context)
    }
    
    func movePrevStage(_ context: TouchGestureExploreModel) {
        stage.prevStage(context)
    }
}
