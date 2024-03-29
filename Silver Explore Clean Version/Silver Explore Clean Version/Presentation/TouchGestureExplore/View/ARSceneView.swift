//
//  ARSceneView.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/8/24.
//

import ARKit
import UIKit

protocol ARScneneViewDelegate: AnyObject {
    func getContainerNode() -> SCNNode?
}

final class ARSceneView: ARSCNView {
    private(set) var onboardingView = OnboardingView()
    private(set) lazy var touchGestureExploreView = TouchGestureExploreView(blurEffect: .init(style: .systemThinMaterialDark))
    
    weak var arSceneViewDelegate: ARScneneViewDelegate?
    
    override init(frame: CGRect, options: [String : Any]? = nil) {
        super.init(frame: frame, options: nil)
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
        
        self.touchGestureExploreView.addUserAction()
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
