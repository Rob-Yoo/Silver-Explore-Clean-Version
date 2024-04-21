//
//  CharacterSelectionModel.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/7/24.
//

import Foundation

class CharacterSelectionModel {
    private var observers = [Observer]()
    var arCharacterCreator: ARCharacterCreator? {
        didSet {
            self.notify()
        }
    }
    var arCharacter: ARCharacterProtocol? {
        guard let creator = self.arCharacterCreator else {
            return nil
        }

        return ARCharacterFactory.createARCharacter(creator)
    }
}

extension CharacterSelectionModel: Publisher {
    func addObserver(_ observer: Observer) {
        observers.append(observer)
    }
    
    func removeObserver(_ observer: Observer) {
        observers = observers.filter { $0.id != observer.id }
    }
    
    func notify() {
        observers.forEach {
            $0.update()
        }
    }
}
