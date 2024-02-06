//
//  CryptoCurrency.swift
//  CryptoTracker
//
//  Created by Berkay on 2.02.2024.
//

import Foundation

struct CryptoData: Codable {

    let status: Status
    let data: [Crypto]
}


struct Crypto: Codable {
    let id: Int
    let rank: Int
    let name: String
    let symbol: String
    let slug: String
    let isActive: Int
    let firstHistoricalData: String
    let lastHistoricalData: String
    
    private enum CodingKeys: String, CodingKey {
        case id, rank, name, symbol, slug, isActive = "is_active", firstHistoricalData = "first_historical_data", lastHistoricalData = "last_historical_data"
    }
}
