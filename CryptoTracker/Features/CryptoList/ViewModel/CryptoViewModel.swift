//
//  CryptoViewModel.swift
//  CryptoTracker
//
//  Created by Berkay on 2.02.2024.
//

import Foundation

@MainActor
class CryptoViewModel : ObservableObject {
    let webService = CMCService()
    @Published var cryptoData : CryptoData?
    @Published var cryptoError : CryptoError?
    @Published var loading : Bool = true
    

    
    func downloadCryptos() {
        self.loading = true
        webService.getCryptoCurrencies() { result in
            switch result {
                case .failure(let error):
                DispatchQueue.main.async {
                    self.cryptoError = error
                }
                
                case .success(let cryptoData):
                DispatchQueue.main.async {
                    self.cryptoData = cryptoData
                }
            }
            DispatchQueue.main.async {
                self.loading = false
            }
        }
        
    }
}
