//
//  CoinResponse.swift
//  Crypto-List
//
//  Created by Phonthep Aungkanukulwit on 14/5/2565 BE.
//

import Foundation

// MARK: - CoinResponse
struct CoinResponse: Codable {
    let status: String
    let data: CoinsData
}

// MARK: - DataClass
struct CoinsData: Codable {
    let stats: Stats
    let coins: [Coin]
}

// MARK: - Coin
struct Coin: Codable {
    var uuid, symbol, name: String
    let color: String?
    let iconURL: String
    let marketCap, price: String
    let listedAt, tier: Int
    let change: String
    let rank: Int
    let sparkline: [String]
    let lowVolume: Bool
    let coinrankingURL: String
    let the24HVolume, btcPrice: String

    enum CodingKeys: String, CodingKey {
        case uuid, symbol, name, color
        case iconURL = "iconUrl"
        case marketCap, price, listedAt, tier, change, rank, sparkline, lowVolume
        case coinrankingURL = "coinrankingUrl"
        case the24HVolume = "24hVolume"
        case btcPrice
    }
}

// MARK: - Stats
struct Stats: Codable {
    let total, totalCoins, totalMarkets, totalExchanges: Int
    let totalMarketCap, total24HVolume: String

    enum CodingKeys: String, CodingKey {
        case total, totalCoins, totalMarkets, totalExchanges, totalMarketCap
        case total24HVolume = "total24hVolume"
    }
}

// MARK: - Mock Data

struct MockData {
    static let coins = [sampleCoin, sampleCoin, sampleCoin]
    
    static let sampleCoin = Coin(uuid: "", symbol: "BTC", name: "Bitcoin", color: nil, iconURL: "https://cdn.coinranking.com/bOabBYkcX/bitcoin_btc.svg", marketCap: "548620780564", price: "28814.523722196856", listedAt: 1330214400, tier: 1, change: "-6.58", rank: 1, sparkline: [""], lowVolume: false, coinrankingURL: "https://coinranking.com/coin/Qwsogvtv82FCd+bitcoin-btc", the24HVolume: "29757854498", btcPrice: "1")
}
