//
//  CryptoListView.swift
//  Crypto-List
//
//  Created by Phonthep Aungkanukulwit on 14/5/2565 BE.
//

import SwiftUI

struct CryptoListView: View {
    @StateObject private var viewModel = CryptoListViewModel()
    
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Buy, sell and hold crypto")
                .font(.system(size: 16))
                .fontWeight(.bold)
                .padding(.horizontal, 8)
            List(viewModel.coins, id: \.rank) { coin in
                CoinListRow(coin: coin)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0))
                    .onTapGesture {
                        viewModel.isShowingSheet = true
                        viewModel.coinDetail = coin
                    }
                    .sheet(isPresented: $viewModel.isShowingSheet, onDismiss: {
                        viewModel.isShowingSheet = false
                    }, content: {
                        if let coinDetail = viewModel.coinDetail {
                            CoinDetailView(isShowingSheet: $viewModel.isShowingSheet, coin: coinDetail)
                        }
                    })
                    .onAppear {
                        if let lastRow = viewModel.coins.last?.rank,
                           lastRow == coin.rank {
                            viewModel.fetchCoin(offset: lastRow + 10)
                        }
                    }
            }
            .listStyle(.plain)
            .onAppear {
                viewModel.getCrytoCoin()
            }
            .refreshable {
                viewModel.clearCoins()
                viewModel.getCrytoCoin()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .padding(.horizontal, 8)
    }
}

struct CryptoListView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoListView()
    }
}
