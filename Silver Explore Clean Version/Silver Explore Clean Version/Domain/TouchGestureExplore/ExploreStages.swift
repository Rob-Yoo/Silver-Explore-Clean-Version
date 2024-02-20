//
//  ExploreStages.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/21/24.
//

import UIKit

protocol ExploreStage {
    var title: String { get }
    var imageName: UIImage { get }
    var description: String { get }
    
    func nextStage(_ context: TouchGestureExploreModel)
    func prevStage(_ context: TouchGestureExploreModel)
}

struct TapStage: ExploreStage {
    var title: String = "탭(터치하기)"
    var imageName: UIImage = .tap
    var description: String = "한 손가락을 사용해\nAR 캐릭터를 한번 탭해보세요!"
    
    func nextStage(_ context: TouchGestureExploreModel) {
        context.stage = LongTapStage()
    }
    
    func prevStage(_ context: TouchGestureExploreModel) {
        context.isFinish = true
    }
}

struct LongTapStage: ExploreStage {
    var title: String = "오래 터치하기"
    var imageName: UIImage = .longTap
    var description: String = "한 손가락을 사용해\nAR 캐릭터를 오래 터치하세요!"
    
    func nextStage(_ context: TouchGestureExploreModel) {
        context.stage = SwipeStage()
    }
    
    func prevStage(_ context: TouchGestureExploreModel) {
        context.stage = TapStage()
    }
}

struct SwipeStage: ExploreStage {
    var title: String = "스와이프(쓸어 넘기기)"
    var imageName: UIImage = .swipeRight
    var description: String = "한 손가락을 사용해\nAR 캐릭터를 빠르게 쓸어 넘겨보세요!"
    
    func nextStage(_ context: TouchGestureExploreModel) {
        context.stage = PanStage()
    }
    
    func prevStage(_ context: TouchGestureExploreModel) {
        context.stage = LongTapStage()
    }
}

struct PanStage: ExploreStage {
    var title: String = "드래그"
    var imageName: UIImage = .drag
    var description: String = "한 손가락을 사용해\nAR 캐릭터를 누른 상태로 손가락을 움직여보세요!"
    
    func nextStage(_ context: TouchGestureExploreModel) {
        context.stage = PinchStage()
    }
    
    func prevStage(_ context: TouchGestureExploreModel) {
        context.stage = SwipeStage()
    }
}

struct PinchStage: ExploreStage {
    var title: String = "확대하기/축소하기"
    var imageName: UIImage = .pinchOut
    var description: String = "두 손가락을 사용해\n손가락을 오므리거나 벌려보세요!"
    
    func nextStage(_ context: TouchGestureExploreModel) {
        context.stage = RotateStage()
    }
    
    func prevStage(_ context: TouchGestureExploreModel) {
        context.stage = PanStage()
    }
}

struct RotateStage: ExploreStage {
    var title: String = "회전하기"
    var imageName: UIImage = .rotate
    var description: String = "두 손가락을 사용해\n누른 상태로 손가락을 회전해보세요!"
    
    func nextStage(_ context: TouchGestureExploreModel) {
        context.isFinish = true
    }
    
    func prevStage(_ context: TouchGestureExploreModel) {
        context.stage = PinchStage()
    }
}
