//
//  ExploreStages.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/21/24.
//

import UIKit

protocol StageData {
    var title: String { get }
    var image: UIImage { get }
    var description: String { get }
    var gestureRecognizers: [UIGestureRecognizer] { get }
}

protocol ExploreStage: StageData {
    func nextStage(_ context: TouchGestureExploreModel)
    func prevStage(_ context: TouchGestureExploreModel)
}

struct TapStage: ExploreStage {
    var title: String = "탭(터치하기)"
    var image: UIImage = .tap
    var description: String = "한 손가락을 사용해\nAR 캐릭터를 한번 탭해보세요!"
    var gestureRecognizers: [UIGestureRecognizer]
    
    init(arCharacter: ARCharacterProtocol) {
        let tapGesture = UITapGestureRecognizer(target: arCharacter, action: #selector(arCharacter.jump))
        self.gestureRecognizers = [tapGesture]
    }
    
    func nextStage(_ context: TouchGestureExploreModel) {
        context.stage = LongPressStage(arCharacter: context.arCharacter)
    }
    
    func prevStage(_ context: TouchGestureExploreModel) {
        context.isFinish.toggle()
    }
}

struct LongPressStage: ExploreStage {
    var title: String = "오래 터치하기"
    var image: UIImage = .longTap
    var description: String = "한 손가락을 사용해\nAR 캐릭터를 오래 터치하세요!"
    var gestureRecognizers: [UIGestureRecognizer]
    
    init(arCharacter: ARCharacterProtocol) {
        let longPressGesture = UILongPressGestureRecognizer(target: arCharacter, action: #selector(arCharacter.highJump))
        self.gestureRecognizers = [longPressGesture]
    }
    
    func nextStage(_ context: TouchGestureExploreModel) {
        context.stage = SwipeStage(arCharacter: context.arCharacter)
    }
    
    func prevStage(_ context: TouchGestureExploreModel) {
        context.stage = TapStage(arCharacter: context.arCharacter)
    }
}

struct SwipeStage: ExploreStage {
    var title: String = "스와이프(쓸어 넘기기)"
    var image: UIImage = .swipeRight
    var description: String = "한 손가락을 사용해\nAR 캐릭터를 빠르게 쓸어 넘겨보세요!"
    var gestureRecognizers: [UIGestureRecognizer]
    
    init(arCharacter: ARCharacterProtocol) {
        let leftSwipeGesture = UISwipeGestureRecognizer(target: arCharacter, action: #selector(arCharacter.rightAngleRotate))
        let rightSwipeGesture = UISwipeGestureRecognizer(target: arCharacter, action: #selector(arCharacter.rightAngleRotate))
        let upSwipeGesture = UISwipeGestureRecognizer(target: arCharacter, action: #selector(arCharacter.rightAngleRotate))
        let downSwipeGesture = UISwipeGestureRecognizer(target: arCharacter, action: #selector(arCharacter.rightAngleRotate))
        
        leftSwipeGesture.direction = .left
        rightSwipeGesture.direction = .right
        upSwipeGesture.direction = .up
        downSwipeGesture.direction = .down
        
        self.gestureRecognizers = [leftSwipeGesture, rightSwipeGesture, upSwipeGesture, downSwipeGesture]
    }
    
    func nextStage(_ context: TouchGestureExploreModel) {
        context.arCharacter.resetAngle()
        context.stage = PanStage(arCharacter: context.arCharacter)
    }
    
    func prevStage(_ context: TouchGestureExploreModel) {
        context.arCharacter.resetAngle()
        context.stage = LongPressStage(arCharacter: context.arCharacter)
    }
}

struct PanStage: ExploreStage {
    var title: String = "드래그"
    var image: UIImage = .drag
    var description: String = "한 손가락을 사용해\n터치한 상태로 손가락을 움직여보세요!"
    var gestureRecognizers: [UIGestureRecognizer]
    
    init(arCharacter: ARCharacterProtocol) {
        let panGesture = UIPanGestureRecognizer(target: arCharacter, action: #selector(arCharacter.eulerAngleRotate))
        self.gestureRecognizers = [panGesture]
    }
    
    func nextStage(_ context: TouchGestureExploreModel) {
        context.stage = PinchStage(arCharacter: context.arCharacter)
    }
    
    func prevStage(_ context: TouchGestureExploreModel) {
        context.stage = SwipeStage(arCharacter: context.arCharacter)
    }
}

struct PinchStage: ExploreStage {
    var title: String = "확대하기/축소하기"
    var image: UIImage = .pinchOut
    var description: String = "두 손가락을 사용해\n손가락을 오므리거나 벌려보세요!"
    var gestureRecognizers: [UIGestureRecognizer]
    
    init(arCharacter: ARCharacterProtocol) {
        let pinchGesture = UIPinchGestureRecognizer(target: arCharacter, action: #selector(arCharacter.scaleUpAndDown))
        self.gestureRecognizers = [pinchGesture]
    }
    
    func nextStage(_ context: TouchGestureExploreModel) {
        context.arCharacter.resetScale()
        context.stage = RotateStage(arCharacter: context.arCharacter)
    }
    
    func prevStage(_ context: TouchGestureExploreModel) {
        context.arCharacter.resetScale()
        context.stage = PanStage(arCharacter: context.arCharacter)
    }
}

struct RotateStage: ExploreStage {
    var title: String = "회전하기"
    var image: UIImage = .rotate
    var description: String = "두 손가락을 사용해\n터치한 상태로 손가락을 회전해보세요!"
    var gestureRecognizers: [UIGestureRecognizer]
    
    init(arCharacter: ARCharacterProtocol) {
        let rotationGesture = UIRotationGestureRecognizer(target: arCharacter, action: #selector(arCharacter.zAxisRotate))
        self.gestureRecognizers = [rotationGesture]
    }
    
    func nextStage(_ context: TouchGestureExploreModel) {
        context.isFinish.toggle()
    }
    
    func prevStage(_ context: TouchGestureExploreModel) {
        context.arCharacter.resetAngle()
        context.stage = PinchStage(arCharacter: context.arCharacter)
    }
}
