//
//  DetailView.swift
//  CryptoTracker
//
//  Created by Berkay on 5.02.2024.
//

import SwiftUI

struct DetailView: View {
    let cryptoId: Int
    let cryptoSymbol: String
    
    @ObservedObject var detailViewModel : DetailViewModel
    
    init(cryptoId: Int, cryptoSymbol: String) {
          self.cryptoId = cryptoId
          self.cryptoSymbol = cryptoSymbol
          self.detailViewModel = DetailViewModel()
      }

    var body: some View {
        VStack {
            if detailViewModel.loading {
                ProgressView("Loading")
            }
            
            else {
                if let _ = detailViewModel.cryptoError {
                    Text("Exception")
                    Button(action: {
                        detailViewModel.getCryptoDetail(id: cryptoId)
                    }, label: {
                        Text("Refresh")
                    }).padding()
                }
                else if let coinData = detailViewModel.coinData?.data[String(cryptoId)] {
                    
                    VStack {
                        HStack (alignment: .center){
                            VStack(alignment: .leading) {
                                Text(coinData.name).font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                Text(coinData.symbol)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                Text(String(format: "%+.2f%%", coinData.quote.usd.percentChange24H))
                                    .foregroundColor(coinData.quote.usd.percentChange24H < 0 ? .red : .green).font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            }
                        }
                        Spacer()
                        Text(String(format:"%.3f $",coinData.quote.usd.price)).font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }.padding()
               
                }
                else {
                    Text(cryptoSymbol)
                }
            }
        }
        .onAppear {
            detailViewModel.getCryptoDetail(id: cryptoId)
        }
        
        .navigationBarTitle(cryptoSymbol, displayMode: .inline)
    }
}

#Preview {
    DetailView(cryptoId: 1, cryptoSymbol: "BTC")
}
