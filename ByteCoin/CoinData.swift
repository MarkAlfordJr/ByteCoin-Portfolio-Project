//
//  CoinData.swift
//  ByteCoin
//
//  Created by Mark Alford on 11/14/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    //gather back the data from the JSON needed
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}
