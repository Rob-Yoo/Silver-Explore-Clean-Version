//
//  ARObjectActionProtocol.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/25/24.
//
import UIKit

@objc protocol JumpActionProtocol {
    @objc func jump()
}

@objc protocol HighJumpActionProtocol {
    @objc func highJump(_ gesture: UILongPressGestureRecognizer)
}

@objc protocol ScaleActionProtocol {
    @objc func scaleUpAndDown(_ gesture: UIPinchGestureRecognizer)
}

@objc protocol RightAngleRotationActionProtocol {
    @objc func rightAngleRotate(_ gesture: UISwipeGestureRecognizer)
}

@objc protocol EulerAngleRotationActionProtocol {
    @objc func eulerAngleRotate(_ gesture: UIPanGestureRecognizer)
}

@objc protocol ZAxisRotationActionProtocol {
    @objc func zAxisRotate(_ gesture: UIRotationGestureRecognizer)
}
