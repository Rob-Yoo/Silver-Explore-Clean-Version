//
//  File.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/19/24.
//

enum Content {
    case TouchGestureExplore
    case KioskExplore
    case AIExplore
    case none
}

class HomeModel: Publisher {
    private var observers = [Observer]()
    var selectedContent: Content = .none {
        didSet {
            self.notify()
        }
    }
    
    func addObserver(_ observer: Observer) {
        self.observers.append(observer)
    }
    
    func removeObserver(_ observer: Observer) {
        self.observers = self.observers.filter { $0.id != observer.id }
    }
    
    func notify() {
        for observer in observers {
          observer.update()
        }
    }
}
