//
//  CryptoDetail.swift
//  CryptoTracker
//
//  Created by Berkay on 5.02.2024.
//

import Foundation

struct CoinData: Codable {
 
    struct CoinDetail: Codable {
        let id: Int
        let name: String
        let symbol: String
        let slug: String
        let numMarketPairs: Int
        let dateAdded: String
        let tags: [String]
        let maxSupply: Double?
        let circulatingSupply: Double
        let totalSupply: Double
        let isActive: Int
        let infiniteSupply: Bool
        let platform: String?
        let cmcRank: Int
        let isFiat: Int
        let selfReportedCirculatingSupply: Double?
        let selfReportedMarketCap: Double?
        let tvlRatio: Double?
        let lastUpdated: String
        
        struct Quote: Codable {
            struct USD: Codable {
                let price: Double
                let volume24h: Double
                let volumeChange24h: Double
                let percentChange1h: Double
                let percentChange24h: Double
                let percentChange7d: Double
                let percentChange30d: Double
                let percentChange60d: Double
                let percentChange90d: Double
                let marketCap: Double
                let marketCapDominance: Double
                let fullyDilutedMarketCap: Double
                let tvl: Double?
                let lastUpdated: String
            }
            
            let USD: USD
        }
        
        let quote: Quote
    }
    
    let status: Status
    let data: [String: CoinDetail]
}
