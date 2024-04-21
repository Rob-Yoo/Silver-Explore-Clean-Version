//
//  ARCharcterViewController.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/7/24.
//

import ARKit
import UIKit
import Combine

class TouchGestureExploreViewController: UIViewController {
    private let sceneView: ARSceneView
    private let model: TouchGestureExploreModel
    private var cancellables = Set<AnyCancellable>()
    
    override func loadView() {
        self.view = sceneView
        self.sceneView.arSceneViewDelegate = self
        self.sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sceneView.beginARSession()
        self.observeModel()
    }
    
    init(arCharacter: ARCharacterProtocol) {
        self.model = TouchGestureExploreModel(arCharacter: arCharacter)
        self.sceneView = ARSceneView(firstStage: self.model.stage)
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
extension TouchGestureExploreViewController: ARSceneViewDelegate {
    func getContainerNode() -> SCNNode? {
        return self.model.getContainerNodeOfARCharacter()
    }
    
    func prevButtonTapped() {
        self.model.movePrevStage(self.model)
    }
    
    func nextButtonTapped() {
        self.model.moveNextStage(self.model)
    }
}

//MARK: - Observing  Model
extension TouchGestureExploreViewController {
    func observeModel() {
        self.model.$stage
            .receive(on: RunLoop.main)
            .sink { [weak self] newStage in
                self?.sceneView.update(exploreStage: newStage)
        }
        .store(in: &cancellables)
        
        self.model.$isFinish
            .receive(on: RunLoop.main)
            .sink { isFinish in
            if (isFinish) {
                NavigationManager.shared.pop()
            }
        }
        .store(in: &cancellables)
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
    TouchGestureExploreViewController(arCharacter: ARCharacterFactory.createARCharacter(ArrCreator()))
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
