//
//  Coinapi.swift
//  Crypto Exchange
//
//  Created by Nikita on 26.11.2023.
//

import UIKit

struct Coinapi: Decodable {
    
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}
