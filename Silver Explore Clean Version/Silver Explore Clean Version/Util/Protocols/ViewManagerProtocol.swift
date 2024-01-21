//
//  Presentable.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 1/19/24.
//


protocol ViewManagerProtocol: ViewProtocol, UserActionProtocol {}

protocol ViewProtocol {
    func buildViewHierachy()
    func applyConstraintsToView()
}

protocol UserActionProtocol {
    func addUserActionListener()
}
