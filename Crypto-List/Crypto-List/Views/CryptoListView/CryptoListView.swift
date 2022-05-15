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
    
    let columnSpacing: CGFloat = 8
    var gridLayout: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: columnSpacing), count: 3)
    }
    
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().sectionIndexBackgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Divider()
                VStack(alignment: .leading) {
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
                        List {
                            if !viewModel.isSearch {
                                Section(header: TopRankSectionHeader()) {
                                    LazyVGrid(columns: gridLayout) {
                                        ForEach(viewModel.coins, id: \.rank) { coin in
                                            if coin.rank <= 3 {
                                                TopRankItemView(coin: coin)
                                                    .onTapGesture {
                                                        viewModel.isShowingSheet = true
                                                        viewModel.coinDetail = coin
                                                    }
                                                    .sheet(isPresented: $viewModel.isShowingSheet,
                                                           onDismiss: {
                                                        viewModel.isShowingSheet = false
                                                    }, content: {
                                                        if let coinDetail = viewModel.coinDetail {
                                                            CoinDetailView(isShowingSheet: $viewModel.isShowingSheet, coin: coinDetail)
                                                        }
                                                    })
                                            }
                                        }
                                    }
                                }
                                .listRowSeparator(.hidden)
                                .listSectionSeparator(.hidden)
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                .padding(.top, 16)
                                .padding(.horizontal, 8)
                            }
                            
                            Section(header: CryptoListHeader()) {
                                ForEach(viewModel.coins, id: \.rank) { coin in
                                    if !viewModel.isSearch, coin.rank > 3 {
                                        CoinListRow(coin: coin)
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
                                    } else if viewModel.isSearch {
                                        CoinListRow(coin: coin)
                                    }
                                }
                            }
                            .listRowSeparator(.hidden)
                            .listSectionSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0))
                        }
                        .listStyle(.grouped)
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
                .navigationBarTitleDisplayMode(.inline)
                .padding(.horizontal, 8)
            }
        }
        .searchable(text: $searchQuery)
        .onAppear {
            viewModel.getCrytoCoin()
        }
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
