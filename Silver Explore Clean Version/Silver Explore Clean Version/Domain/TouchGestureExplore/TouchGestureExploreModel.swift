//
//  TouchGestureExploreModel.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/17/24.
//

import ARKit

class TouchGestureExploreModel {
    private var arCharacter: ARCharacterProtocol
    var stage: ExploreStage = TapStage()
    var isFinish: Bool = false
    
    init(arCharacter: ARCharacterProtocol) {
        self.arCharacter = arCharacter
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
