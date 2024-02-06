//
//  ContentView.swift
//  CryptoTracker
//
//  Created by Berkay on 2.02.2024.
//

import SwiftUI

struct CryptoTrackerView: View {
    
    @ObservedObject var cryptoViewModel : CryptoViewModel
    
    init() {
        self.cryptoViewModel = CryptoViewModel()
    }
    
    var body: some View {
        NavigationView {

            List(cryptoViewModel.cryptoData?.data ?? [], id: \.id ) {crypto in VStack {
                    Text(crypto.name)
                }
                
            }
        }.onAppear {
            cryptoViewModel.downloadCryptos()
        }
    }
}

#Preview {
    CryptoTrackerView()
}
