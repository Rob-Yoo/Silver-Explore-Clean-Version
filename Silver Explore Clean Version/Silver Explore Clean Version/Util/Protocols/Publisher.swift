//
//  Publisher.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/21/24.
//

protocol Publisher {
    var observers: [Observer] { get }
    
    func addObserver(_ observer: Observer)
    func removeObserver(_ observer: Observer)
    func notify()
}
