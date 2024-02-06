//
//  WebService.swift
//  CryptoTracker
//
//  Created by Berkay on 2.02.2024.
//

import Foundation

class CMCService {
    
    private let getDataUrl : String = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/map"
    private let getDetailUrl : String = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest"
    private let apiKey : String = "API_KEY"

    func getCryptoCurrencies(completion: @escaping (Result<CryptoData?, CryptoError>) -> Void) {
        var urlComponents : URLComponents = URLComponents(string: getDataUrl)!
        
        urlComponents.queryItems = [URLQueryItem(name: "limit", value: "30"),
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
    
    
    func getCryptoDetail(id : Int,completion: @escaping (Result<CoinData?, CryptoError>) -> Void) {
        var urlComponents : URLComponents = URLComponents(string: getDetailUrl)!
        
        urlComponents.queryItems = [URLQueryItem(name: "id", value: String(id))]
  
        var request = URLRequest(url: urlComponents.url!)
        request.addValue(apiKey, forHTTPHeaderField: "X-CMC_PRO_API_KEY")
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                completion(.failure(.requestError))
            } else if let data = data {
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        do {
                            let coinData = try JSONDecoder().decode(CoinData.self, from: data)
                            completion(.success(coinData))
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
