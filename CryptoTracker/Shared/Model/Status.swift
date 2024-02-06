//
//  Status.swift
//  CryptoTracker
//
//  Created by Berkay on 5.02.2024.
//

import Foundation

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
