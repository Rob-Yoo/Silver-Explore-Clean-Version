//
//  Product.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/29/24.
//

import UIKit

struct Product {
    let name: String
    let image: UIImage
    let detail: ProductDetail
    
    static func createProduct(itemInfo: ItemInfo) -> Product {
        let name = itemInfo.name
        let image = itemInfo.image
        let price = itemInfo.price
    
        if itemInfo.isIceOnly {
            return Product(name: name, image: image, detail: .init(price: price, temperature: .iceOnly, iceQuantity: .regular))
        }
        
        return Product(name: name, image: image, detail: .init(price: price))
    }
}

