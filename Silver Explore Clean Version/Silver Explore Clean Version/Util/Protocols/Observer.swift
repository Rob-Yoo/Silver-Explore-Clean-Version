//
//  Observer.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/21/24.
//

protocol Observer {
    var id: String { get }

    func update()
}
