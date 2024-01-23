//
//  Presentable.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/19/24.
//


protocol ViewManagerProtocol: ViewProtocol, UserActionProtocol {}

protocol ViewProtocol {
    func buildViewHierachy()
    func configureViewConstraints()
}

protocol UserActionProtocol {
    func addUserActionListener()
}
