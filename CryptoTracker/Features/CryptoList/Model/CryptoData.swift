//
//  CryptoCurrency.swift
//  CryptoTracker
//
//  Created by Berkay on 2.02.2024.
//

import Foundation

struct CryptoData: Codable {
    struct Status: Codable {
        let timestamp: String
        let errorCode: Int
        let errorMessage: String?
        let elapsed: Int
        let creditCount: Int
        let notice: String?
        
        private enum CodingKeys: String, CodingKey {
            case timestamp, errorCode = "error_code", errorMessage = "error_message", elapsed, creditCount = "credit_count", notice
        }
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
    
    let status: Status
    let data: [Crypto]
}
