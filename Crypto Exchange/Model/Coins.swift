//
//  Coins.swift
//  Crypto Exchange
//
//  Created by Nikita on 26.11.2023.
//

import Foundation

struct Coins: Codable {
    
    let crypto: String
    let fiat: String
    let rate: Double
    
}
