//
//  CryptoListViewModel.swift
//  Crypto-List
//
//  Created by Phonthep Aungkanukulwit on 14/5/2565 BE.
//

import Foundation

class CryptoListViewModel: ObservableObject {
    @Published var coins: [Coin] = []
    @Published var isLoading = false
    @Published var isFirstLoading = false
    @Published var isShowingSheet = false
    @Published var coinDetail: Coin?
    @Published var isShowErrorView = false
    
    func getCrytoCoin() {
        isFirstLoading = true
        NetworkManager.shared.getCoin { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.coins = response.data.coins
                    self?.isFirstLoading = false
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func fetchCoin(offset: Int) {
        isLoading = true
        NetworkManager.shared.fetchCoin(offset: offset) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.coins.append(contentsOf: response.data.coins)
                    self?.isLoading = false
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func clearCoins() {
        coins = []
    }
}
