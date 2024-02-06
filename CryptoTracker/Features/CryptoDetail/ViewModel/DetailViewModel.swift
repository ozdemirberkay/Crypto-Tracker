//
//  CryptoViewModel.swift
//  CryptoTracker
//
//  Created by Berkay on 2.02.2024.
//

import Foundation

@MainActor
class DetailViewModel : ObservableObject {
    let webService = CMCService()
    @Published var coinData : CoinData?
    @Published var cryptoError : CryptoError?
    @Published var loading : Bool = true
    
    func getCryptoDetail(id : Int) {
        self.loading = true
        webService.getCryptoDetail(id: id, completion: { result in
            DispatchQueue.main.async {
            switch result {
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.cryptoError = error
                    }
                case .success(let coinData):
                    DispatchQueue.main.async {
                        self.coinData = coinData
                    }
            }
            }
            DispatchQueue.main.async {
                self.loading = false
            }
        })
    }
}
