//
//  ProductDetail.swift
//  Silver Explore Clean Version
//
//  Created by Jinyoung Yoo on 4/12/24.
//

import Combine

class OrderDetail {
    private let price: Int
    @Published private(set) var count: Int = 1
    @Published private(set) var temperature: Temperature
    private(set) var size: Size
    private(set) var iceQuantity: IceQuantity
    
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
    
    init(price: Int, temperature: Temperature = .hot, size: Size = .regular, iceQuantity: IceQuantity = .none) {
        self.price = price
        self.temperature = temperature
        self.size = size
        self.iceQuantity = iceQuantity
    }
}

//MARK: - ProductDetail Updating Methods
extension OrderDetail {
    func removeCount() {
        if (self.count > 1) {
            self.count -= 1
        }
    }
    
    func addCount() {
        if (self.count < 6) {
            self.count += 1
        }
    }
    
    func changeTemperature(_ temp: Temperature) {
        self.temperature = temp
        print(self, self.temperature)
    }
    
    func changeSize(_ size: Size) {
        self.size = size
    }
    
    func changeIceQuantity(_ quantity: IceQuantity) {
        self.iceQuantity = quantity
    }
}
