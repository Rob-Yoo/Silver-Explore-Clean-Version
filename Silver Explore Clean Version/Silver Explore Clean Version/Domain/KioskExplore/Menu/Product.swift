//
//  Product.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 2/29/24.
//

import UIKit

struct Product: Hashable {
    let name: String
    let image: UIImage
    var price: Int
    var option: ProductOption
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
    }
}

struct ProductOption {
    enum Temperature {
        case hot, ice, iceOnly
    }

    enum Size {
        case regular, grande, venti
    }

    enum IceQuantity {
        case less, regular, extra, none
    }
    
    var temperature: Temperature
    var size: Size
    var iceQuantity: IceQuantity
    
    init(temperature: Temperature = .hot, size: Size = .regular, iceQuantity: IceQuantity = .none) {
        self.temperature = temperature
        self.size = size
        self.iceQuantity = iceQuantity
    }
}

