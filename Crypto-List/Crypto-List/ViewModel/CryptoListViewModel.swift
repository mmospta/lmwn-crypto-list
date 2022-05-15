//
//  CryptoListViewModel.swift
//  Crypto-List
//
//  Created by Phonthep Aungkanukulwit on 14/5/2565 BE.
//

import Foundation

class CryptoListViewModel: ObservableObject {
    @Published var coins: [Coin] = []
    @Published var coinDetail: Coin?
    @Published var isLoading = false
    @Published var isFirstLoading = false
    @Published var isFirstShowErrorView = false
    @Published var isShowingSheet = false
    @Published var isShowErrorView = false
    @Published var isShowSearchNoResultView = false
    @Published var isSearch = false
    
    func getCrytoCoin() {
        isFirstLoading = true
        isFirstShowErrorView = false
        isShowErrorView = false
        NetworkManager.shared.getCoin { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.coins = response.data.coins
                    self?.isFirstLoading = false
                    self?.isShowErrorView = false
                    self?.isFirstShowErrorView = false
                case .failure:
                    self?.isFirstLoading = false
                    self?.isFirstShowErrorView = true
                }
            }
        }
    }
    
    func fetchCoin(offset: Int) {
        isLoading = true
        isFirstShowErrorView = false
        isShowErrorView = false
        NetworkManager.shared.fetchCoin(offset: offset) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.coins.append(contentsOf: response.data.coins)
                    self?.isLoading = false
                    self?.isShowErrorView = false
                    self?.isFirstShowErrorView = false
                case .failure:
                    self?.isLoading = false
                    self?.isShowErrorView = true
                }
            }
        }
    }
    
    func clearCoins() {
        coins = []
    }
    
    func fetchSearchCoin(searchQuery: String) {
        isFirstLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            NetworkManager.shared.fetchSearchCoin(searchQuery: searchQuery) { [weak self] result in
                DispatchQueue.main.async { [self] in
                    switch result {
                    case .success(let response):
                        self?.isFirstLoading = false
                        self?.coins = response.data.coins
                        if response.data.coins.isEmpty {
                            self?.isShowSearchNoResultView = true
                        } else {
                            self?.isShowSearchNoResultView = false
                        }
                    case .failure:
                        self?.isFirstLoading = false
                        self?.isShowSearchNoResultView = true
                    }
                }
            }
        }
    }
    
    func hiddenSearchNoResultView() {
        isShowSearchNoResultView = false
    }
    
    func searchCoins(searchQuery: String) {
        if searchQuery.isEmpty {
            isSearch = false
            hiddenSearchNoResultView()
            clearCoins()
            getCrytoCoin()
        } else {
            isSearch = true
            clearCoins()
            fetchSearchCoin(searchQuery: searchQuery)
        }
    }
    
    func pullRefresh() {
        if !isSearch {
            clearCoins()
            getCrytoCoin()
        }
    }
}
