//
//  Product.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/29/24.
//

import UIKit

protocol ProductData {
    var name: String { get }
    var image: UIImage { get }
    var price: Int { get }
    var count: Int { get }
    var temperature: Temperature { get }
    var size: Size { get }
    var iceQuantity: IceQuantity { get }
    var totalPrice: Int { get }
}

class Product: ProductData {
    let name: String
    let image: UIImage
    let price: Int
    var count: Int {
        didSet {
            self.postOrderDetailChanged()
        }
    }
    var temperature: Temperature {
        didSet {
            self.postOrderDetailChanged()
        }
    }
    var size: Size {
        didSet {
            self.postOrderDetailChanged()
        }
    }
    var iceQuantity: IceQuantity {
        didSet {
            self.postOrderDetailChanged()
        }
    }
    
    var totalPrice: Int {
        let iceCost = (self.temperature == .ice) ? 500 : 0
        var sizeCost: Int

        switch self.size {
        case .regular:
            sizeCost = 0
        case .grande:
            sizeCost = 500
        case .venti:
            sizeCost = 1000
        }

        return (self.price + iceCost + sizeCost) * self.count
    }

    private init(name: String,
                 image: UIImage,
                 price: Int,
                 count: Int = 1,
                 temperature: Temperature,
                 size: Size = .regular,
                 iceQuantity: IceQuantity = .regular) {
        self.name = name
        self.image = image
        self.count = count
        self.price = price
        self.temperature = temperature
        self.size = size
        self.iceQuantity = iceQuantity
    }
    
    static func createProduct(itemInfo: ItemInfo) -> Product {
        let name = itemInfo.name
        let image = itemInfo.image
        let price = itemInfo.price
    
        if itemInfo.isIceOnly {
            return Product(name: name, image: image, price: price, temperature: .iceOnly)
        }
        return Product(name: name, image: image, price: price, temperature: .hot)
    }
    
    private func postOrderDetailChanged() {
        NotificationCenter.default.post(name: .OrderDetailChanged, object: nil)
    }
}

extension Product {
    func removeCount() {
        if (self.count > 1) {
            self.count -= 1
        }
    }
    
    func addCount() {
        if (self.count < 5) {
            self.count += 1
        }
    }
    
    func changeTemperature(_ temp: Temperature) {
        self.temperature = temp
    }
    
    func changeSize(_ size: Size) {
        self.size = size
    }
    
    func changeIceQuantity(_ quantity: IceQuantity) {
        self.iceQuantity = quantity
    }
}

