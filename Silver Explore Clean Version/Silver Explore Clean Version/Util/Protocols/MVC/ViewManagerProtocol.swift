//
//  ViewManagerProtocol.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/19/24.
//

protocol ViewProtocol {
    func buildViewHierachy()
    func configureViewConstraints()
}

protocol ViewManagerProtocol: ViewProtocol {
    func addUserActionListener()
}
