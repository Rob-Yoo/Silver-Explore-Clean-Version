//
//  TouchGestureExploreViewController.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/23/24.
//

import UIKit

class TouchGestureExploreViewController: UIViewController {
    var id = String(describing: TouchGestureExploreViewController.self)
    private let characterSelectView = CharacterSelectView()
    private let model = CharacterSelectionModel()
    private var willUpdateView: UIView?
    
    override func loadView() {
        super.loadView()
        
        self.view = characterSelectView
        self.characterSelectView.characterSelectViewDelegate = self
        self.characterSelectView.addUserActionListener()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.model.addObserver(self)
    }
}

//MARK: - User Action Handling
extension TouchGestureExploreViewController: CharacterSelectViewDelegate {
    @objc func prevButtonTapped() {
        NavigationManager.shared.pop()
    }
    
    @objc func arrSelected() {
        self.willUpdateView = self.characterSelectView.selectionStackView.arrSelectionView
        
        self.model.arCharacterCreator = ArrCreator()
    }
    
    @objc func finnSelected() {
        self.willUpdateView = self.characterSelectView.selectionStackView.finnSelectionView
        
        self.model.arCharacterCreator = FinnCreator()
    }

    @objc func exploreStartButtonTapped() {
        guard let arCharacter = self.model.arCharacter else {
            print("캐릭터가 선택되지 않았습니다.")
            // TODO: - 캐릭터 선택되지 않았다는 알림 띄우기
            return
        }

        let arCharacterVC = ARCharcterViewController(arCharacter: arCharacter) 
        
        NavigationManager.shared.push(arCharacterVC)
    }
}

//MARK: - Observing Model
extension TouchGestureExploreViewController: Observer {
    func update() {
        guard let view = self.willUpdateView else { return }

        self.characterSelectView.update(view)
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
        TouchGestureExploreViewController()
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

