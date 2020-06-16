//
//  CoinData.swift
//  ByteCoin
//
//  Created by JSworkstation on 2020/06/16.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Decodable {
    let asset_id_quote: String
    let rate: Double
}
