//
//  WebService.swift
//  CryptoTracker
//
//  Created by Berkay on 2.02.2024.
//

import Foundation

class CMCService {
    
    private let getDataUrl : String = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/map"
    private let apiKey : String = "7aa45bda-4737-4714-b0da-e487e5e39ffb"

    func downloadCryptoCurrencies(completion: @escaping (Result<CryptoData?, CryptoError>) -> Void) {
        var urlComponents : URLComponents = URLComponents(string: getDataUrl)!
        
        urlComponents.queryItems = [URLQueryItem(name: "limit", value: "10"),
                                    URLQueryItem(name: "sort", value: "cmc_rank")]
        
        var request = URLRequest(url: urlComponents.url!)
        request.addValue(apiKey, forHTTPHeaderField: "X-CMC_PRO_API_KEY")
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                completion(.failure(.requestError))
            } else if let data = data {
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        do {
                            let cryptoData = try JSONDecoder().decode(CryptoData.self, from: data)
                            completion(.success(cryptoData))
                        } catch {
                            completion(.failure(.parseError))
                        }
                    }
                    else {
                        completion(.failure(.apiError))
                    }
                }
                else {
                    completion(.failure(.apiError))
                }
                
            } else {
                completion(.failure(.dataError))
            }
        }
        
        task.resume()
    }
}

enum CryptoError : Error {
    case requestError
    case parseError
    case dataError
    case apiError
}
