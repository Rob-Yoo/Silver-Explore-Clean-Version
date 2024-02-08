//
//  TouchGestureExploreViewController.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/23/24.
//

import UIKit

class ARCharacterSelectionViewController: UIViewController {
    var id = String(describing: ARCharacterSelectionViewController.self)
    private let characterSelectionView = CharacterSelectionView()
    private let model = CharacterSelectionModel()
    private var willUpdateView: UIView?
    
    override func loadView() {
        super.loadView()

        self.view = characterSelectionView
        self.characterSelectionView.characterSelectViewDelegate = self
        self.characterSelectionView.addUserActionListener()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.model.addObserver(self)
    }
}

//MARK: - User Action Handling
extension ARCharacterSelectionViewController: CharacterSelectViewDelegate {
    @objc func prevButtonTapped() {
        NavigationManager.shared.pop()
    }
    
    @objc func arrSelected(recognizer: UITapGestureRecognizer) {
        guard let arrSelectionview = recognizer.view else { return }
        
        self.willUpdateView = arrSelectionview
        self.model.arCharacterCreator = ArrCreator()
    }
    
    @objc func finnSelected(recognizer: UITapGestureRecognizer) {
        guard let finnSelectionView = recognizer.view else { return }
        
        self.willUpdateView = finnSelectionView
        self.model.arCharacterCreator = FinnCreator()
    }

    @objc func exploreStartButtonTapped() {
        guard let arCharacter = self.model.arCharacter else {
            print("캐릭터가 선택되지 않았습니다.")
            // TODO: - 캐릭터 선택되지 않았다는 알림 띄우기
            return
        }

        let arCharacterVC = TouchGestureExploreViewController(arCharacter: arCharacter) 
        
        NavigationManager.shared.push(arCharacterVC)
    }
}

//MARK: - Observing Model
extension ARCharacterSelectionViewController: Observer {
    func update() {
        guard let view = self.willUpdateView else { return }

        self.characterSelectionView.update(view)
    }
}

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable_ACSVC: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController{
        ARCharacterSelectionViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_ACSVC_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable_ACSVC()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
        }
        
    }
} #endif

