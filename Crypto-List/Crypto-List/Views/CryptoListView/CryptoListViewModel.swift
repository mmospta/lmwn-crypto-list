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
    
    func getCrytoCoin() {
        isLoading = true
        NetworkManager.shared.getCoin { [weak self] result in
            switch result {
            case .success(let response):
                self?.coins = response.data.coins
                self?.isLoading = false
            case .failure(let error):
                print(error)
            }
        }
    }
}
