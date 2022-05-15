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
    @Published var isShowingSheet = false
    @Published var isShowErrorView = false
    @Published var isFirstShowErrorView = false
    
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
}
