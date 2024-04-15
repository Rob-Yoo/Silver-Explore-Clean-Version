//
//  Product.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/29/24.
//

import UIKit
import Combine

struct Product {
    let name: String
    let image: UIImage
    var orderDetail: OrderDetail
    
    static func createProduct(itemInfo: ItemInfo) -> Product {
        let name = itemInfo.name
        let image = itemInfo.image
        let price = itemInfo.price
    
        if itemInfo.isIceOnly {
            return Product(name: name, image: image, orderDetail: .init(price: price, temperature: .iceOnly, iceQuantity: .regular))
        }
        
        return Product(name: name, image: image, orderDetail: .init(price: price))
    }
}

