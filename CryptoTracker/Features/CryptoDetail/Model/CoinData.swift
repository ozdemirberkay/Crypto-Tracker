//
//  CryptoDetail.swift
//  CryptoTracker
//
//  Created by Berkay on 5.02.2024.
//

import Foundation
struct CoinData: Codable {
    let status: Status
    let data: [String: CoinDetail]
}

struct CoinDetail: Codable {
    let id: Int
    let name, symbol, slug: String
    let numMarketPairs: Int
    let dateAdded: String
    let tags: [String]
    let circulatingSupply, totalSupply: Double
    let isActive: Int
    let infiniteSupply: Bool
    let cmcRank, isFiat: Int
    let lastUpdated: String
    let quote: Quote

    enum CodingKeys: String, CodingKey {
        case id, name, symbol, slug
        case numMarketPairs = "num_market_pairs"
        case dateAdded = "date_added"
        case tags
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case isActive = "is_active"
        case infiniteSupply = "infinite_supply"
        case cmcRank = "cmc_rank"
        case isFiat = "is_fiat"
        case lastUpdated = "last_updated"
        case quote
    }
}

struct Quote: Codable {
    let usd: Usd

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}

struct Usd: Codable {
    let price, volume24H, volumeChange24H, percentChange1H: Double
    let percentChange24H, percentChange7D, percentChange30D, percentChange60D: Double
    let percentChange90D, marketCap, marketCapDominance, fullyDilutedMarketCap: Double
    let lastUpdated: String

    enum CodingKeys: String, CodingKey {
        case price
        case volume24H = "volume_24h"
        case volumeChange24H = "volume_change_24h"
        case percentChange1H = "percent_change_1h"
        case percentChange24H = "percent_change_24h"
        case percentChange7D = "percent_change_7d"
        case percentChange30D = "percent_change_30d"
        case percentChange60D = "percent_change_60d"
        case percentChange90D = "percent_change_90d"
        case marketCap = "market_cap"
        case marketCapDominance = "market_cap_dominance"
        case fullyDilutedMarketCap = "fully_diluted_market_cap"
        case lastUpdated = "last_updated"
    }
}
