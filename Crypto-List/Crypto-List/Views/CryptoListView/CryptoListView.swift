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
        ZStack {
            VStack(alignment: .leading) {
                Text("Buy, sell and hold crypto")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding(.horizontal, 8)
                List(viewModel.coins, id: \.uuid) { coin in
                    CoinListRow(coin: coin)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0))
                }
                .listStyle(.plain)
                .onAppear {
                    viewModel.getCrytoCoin()
                }
                .refreshable {
                    viewModel.getCrytoCoin()
                }
            }
            .padding(.horizontal, 8)
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
    }
}

struct CryptoListView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoListView()
    }
}
