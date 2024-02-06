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
            VStack {
                if cryptoViewModel.loading {
                    ProgressView("Loading")
                }
                else {
                    if let _ = cryptoViewModel.cryptoError {
                        Text("Exception")
                        Button(action: {
                            cryptoViewModel.downloadCryptos()
                        }, label: {
                            Text("Refresh")
                        }).padding()
                    }
                    else {
                        List(cryptoViewModel.cryptoData?.data ?? [], id: \.id ) {crypto in  NavigationLink(destination: DetailView(cryptoId: crypto.id, cryptoSymbol: crypto.symbol)) {
                            VStack(alignment: .leading)  {
                                Text(crypto.name).bold().font(.title2)
                                Text(crypto.symbol)
                            }
                        }
                        }
                    }
                }
               
                }.navigationBarTitle("Crypto Tracker", displayMode: .inline)
        }
        .onAppear {
            cryptoViewModel.downloadCryptos()
        }
    }
}

#Preview {
    CryptoTrackerView()
}
