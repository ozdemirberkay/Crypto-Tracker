//
//  CryptoViewModel.swift
//  CryptoTracker
//
//  Created by Berkay on 2.02.2024.
//

import Foundation

class CryptoViewModel : ObservableObject {
    let webService = CMCService()
    @Published var cryptoData : CryptoData?
    @Published var cryptoError : CryptoError?
    

    
    func downloadCryptos() {
        webService.downloadCryptoCurrencies() { result in
            switch result {
                case .failure(let error):
                self.cryptoError = error
                case .success(let cryptoData):
                DispatchQueue.main.async {
                    self.cryptoData = cryptoData
                }
            }
        }
    }
}
