//
//  ARObjectActionProtocol.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/25/24.
//
import UIKit

protocol JumpActionProtocol {
    func jump()
}

protocol HighJumpActionProtocol {
    func highJump(_ gesture: UILongPressGestureRecognizer)
}

protocol ScaleActionProtocol {
    func scaleUpAndDown(_ gesture: UIPinchGestureRecognizer)
}

protocol RightAngleRotationActionProtocol {
    func rightAngleRotate(_ gesture: UISwipeGestureRecognizer)
}

protocol EulerAngleRotationActionProtocol {
    func eulerAngleRotate(_ gesture: UIPanGestureRecognizer)
}

protocol ZAxisRotationActionProtocol {
    func zAxisRotate(_ gesture: UIRotationGestureRecognizer)
}
