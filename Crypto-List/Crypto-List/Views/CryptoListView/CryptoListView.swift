//
//  CryptoListView.swift
//  Crypto-List
//
//  Created by Phonthep Aungkanukulwit on 14/5/2565 BE.
//

import SwiftUI

struct CryptoListView: View {
    @StateObject private var viewModel = CryptoListViewModel()
    @State var searchQuery = ""
    
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Divider()
                VStack(alignment: .leading) {
                    if !viewModel.isShowSearchNoResultView {
                        Text("Buy, sell and hold crypto")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .padding(.horizontal, 8)
                    }
                    
                    if viewModel.isFirstShowErrorView {
                        ErrorView(viewModel: viewModel)
                            .padding(16)
                        Spacer()
                    }
                    
                    if viewModel.isFirstLoading {
                        LoadingView()
                            .padding(16)
                        Spacer()
                    } else if viewModel.isShowSearchNoResultView {
                        SearchNoResultView()
                    } else {
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
                                        viewModel.fetchCoin(offset: lastRow)
                                    }
                                }
                        }
                        .listStyle(.plain)
                        .refreshable {
                            if !viewModel.isSearch {
                                viewModel.clearCoins()
                                viewModel.getCrytoCoin()
                            }
                        }
                    }
                    
                    if viewModel.isLoading {
                        LoadingView()
                    }
                    
                    if viewModel.isShowErrorView {
                        ErrorView(viewModel: viewModel)
                    }
                }
                .padding(.horizontal, 8)
                .padding(.top, 20)
                .onAppear {
                    viewModel.getCrytoCoin()
                }
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .searchable(text: $searchQuery)
        .onChange(of: searchQuery) { searchQuery in
            viewModel.searchCoins(searchQuery: searchQuery)
        }
    }
}

struct CryptoListView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoListView()
    }
}
