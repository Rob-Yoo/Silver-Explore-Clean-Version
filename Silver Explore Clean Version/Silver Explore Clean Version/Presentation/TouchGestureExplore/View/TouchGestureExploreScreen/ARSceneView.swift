//
//  ARSceneView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/8/24.
//

import ARKit
import UIKit

@objc protocol ARSceneViewDelegate: AnyObject {
    func getContainerNode() -> SCNNode?
    @objc func prevButtonTapped()
    @objc func nextButtonTapped()
}

final class ARSceneView: ARSCNView {
    private var exploreStage: StageData
    private(set) var onboardingView = OnboardingView()
    private(set) lazy var touchGestureExploreView: TouchGestureExploreView = {
        TouchGestureExploreView(blurEffect: .init(style: .systemThinMaterialDark), firstStage: self.exploreStage)
    }()
    
    weak var arSceneViewDelegate: ARSceneViewDelegate?
    
    init(firstStage: StageData) {
        self.exploreStage = firstStage
        super.init(frame: .zero, options: nil)
        self.delegate = self
        self.configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        self.configureOnboardingView()
    }
    
    private func configureOnboardingView() {
        self.addSubview(self.onboardingView)
        
        self.onboardingView
            .widthAnchor(self.widthAnchor)
            .heightAnchor(self.heightAnchor)
    }
    
    private func configureTouchGestureExploreView() {
        self.addSubview(self.touchGestureExploreView)

        self.touchGestureExploreView.alpha = 0.0

        self.touchGestureExploreView
            .widthAnchor(self.widthAnchor)
            .heightAnchor(self.heightAnchor)
        
        UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseInOut) {
            self.touchGestureExploreView.alpha = 1.0
        }
        
        self.addUserAction()
    }
}

//MARK: - Setup ARSession
extension ARSceneView: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        if let _ = anchor as? ARImageAnchor, let delegate = arSceneViewDelegate {
            DispatchQueue.main.async {
                self.onboardingView.removeFromSuperview()
                self.configureTouchGestureExploreView()
            }
            return delegate.getContainerNode()
        }
        
        return nil
    }
    
    func beginARSession() {
        let configuration = ARImageTrackingConfiguration()
        
        guard let trackingImage = ARReferenceImage.referenceImages(inGroupNamed: "Explore Ticket", bundle: Bundle.main) else {
            return
        }
        
        configuration.trackingImages = trackingImage
        configuration.maximumNumberOfTrackedImages = 1

        self.session.run(configuration)
    }
}

// MARK: - Communicate with Controller
extension ARSceneView {
    func addUserAction() {
        guard let delegate = arSceneViewDelegate else {
            fatalError("ARSceneViewDelegate 지정 후 사용해주세요!")
        }
        
        self.touchGestureExploreView.exploreIndicatorStackView.prevButton.addTarget(delegate, action: #selector(delegate.prevButtonTapped), for: .touchUpInside)
        self.touchGestureExploreView.exploreIndicatorStackView.nextButton.addTarget(delegate, action: #selector(delegate.nextButtonTapped), for: .touchUpInside)
    }

    func update(exploreStage: StageData) {
        self.touchGestureExploreView.update(exploreStage: exploreStage)
    }
}
