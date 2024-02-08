//
//  ARCharcterViewController.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/7/24.
//

import ARKit
import UIKit

class TouchGestureExploreViewController: UIViewController {
    private let sceneView = ARSceneView(frame: .infinite)
    private let arCharacter: ARCharacterProtocol
    
    override func loadView() {
        self.view = sceneView
        self.sceneView.arSceneViewDelegate = self
        self.sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sceneView.beginARSession()
    }
    
    init(arCharacter: ARCharacterProtocol) {
        self.arCharacter = arCharacter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.sceneView.session.pause()
    }
    
}

//MARK: - Communicate with View
extension TouchGestureExploreViewController: ARScneneViewDelegate {
    func getContainerNode() -> SCNNode? {
        return self.arCharacter.getContainerNode()
    }
}

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable_TGEVC: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController{
    TouchGestureExploreViewController(arCharacter: Arr(containerNode: Arr.makeContainerNode()!))
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_TGEVC_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable_TGEVC()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
        }
        
    }
} #endif
