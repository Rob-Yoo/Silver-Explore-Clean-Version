//
//  Menu.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/29/24.
//

import UIKit

typealias ItemInfo = (name: String, image: UIImage, price: Int, isIceOnly: Bool)

struct Menu {
    let itemList: [[ItemInfo]] = [
            [
                (name: "수박주스", image: .watermelonJuice, price: 6300, isIceOnly: true),
                (name: "자몽에이드", image: .grapefruitAde, price: 5800, isIceOnly: true),
                (name: "망고프라페", image: .mangoFrappe, price: 6000, isIceOnly: true),
                (name: "딸기프라페", image: .strawberryFrappe, price: 6500, isIceOnly: true),
                (name: "복숭아에이드", image: .peachAde, price: 5800, isIceOnly: true),
                (name: "청귤스파클링", image: .greenTangerineSparkling, price: 6300, isIceOnly: true),
                (name: "애플망고주스", image: .appleMangoJuice, price: 6300, isIceOnly: true)
            ],
            [
                (name: "아메리카노", image: .americano, price: 4500, isIceOnly: false),
                (name: "카페라떼", image: .cafeLatte, price: 5000, isIceOnly: false),
                (name: "카푸치노", image: .cappuccino, price: 5000, isIceOnly: false),
                (name: "바닐라라뗴", image: .vanillaLatte, price: 5500, isIceOnly: false),
                (name: "카페모카", image: .cafeMoka, price: 5500, isIceOnly: false),
                (name: "숏라떼", image: .shotLatte, price: 5000, isIceOnly: false),
                (name: "롱블랙", image: .longBlack, price: 4500, isIceOnly: false),
                (name: "달고나라떼", image: .dalgonaLatte, price: 6000, isIceOnly: false),
                (name: "흑임자라떼", image: .blackSesameLatte, price: 6100, isIceOnly: false),
                (name: "콜드브루", image: .coldbrew, price: 4900, isIceOnly: true),
                (name: "콜드브루라떼", image: .coldbrewLatte, price: 5400, isIceOnly: true)
            ],
            [
                (name: "로얄밀크티", image: .royalMilkTea, price: 5500, isIceOnly: false),
                (name: "그린티라떼", image: .greenTeaLatte, price: 5200, isIceOnly: false),
                (name: "유자레몬티", image: .citronLemonTea, price: 5500, isIceOnly: false),
                (name: "애플민트티", image: .appleMintTea, price: 5500, isIceOnly: false),
                (name: "쑥라떼", image: .mugwortLatte, price: 5500, isIceOnly: false),
                (name: "고구마라뗴", image: .sweetPotatoLatte, price: 5000, isIceOnly: false),
                (name: "애플망고주스", image: .appleMangoJuice, price: 6300, isIceOnly: true),
                (name: "오렌지에이드", image: .orangeAde, price: 5000, isIceOnly: true),
                (name: "말차프라페", image: .jejuMatchaFrappe, price: 5800, isIceOnly: true),
                (name: "요거트프라페", image: .yogurtFrappe, price: 5000, isIceOnly: true),
                (name: "망고프라페", image: .mangoFrappe, price: 5000, isIceOnly: true),
                (name: "초콜릿라뗴", image: .chocolateLatte, price: 5000, isIceOnly: true)
            ]
    ]
}
