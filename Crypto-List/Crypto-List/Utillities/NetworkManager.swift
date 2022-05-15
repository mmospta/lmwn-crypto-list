//
//  NetworkManager.swift
//  Crypto-List
//
//  Created by Phonthep Aungkanukulwit on 14/5/2565 BE.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseURL = "https://api.coinranking.com"
    
    func getCoin(completion: @escaping (Result<CoinResponse, AFError>) -> Void) {
        URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
        let headers: HTTPHeaders = [
            "x-access-token": "coinranking05d52d3adfd70374eb462a8b63050f3a3651c9886bcf28d3"
        ]
        let parameters = ["limit": "10"]
        AF.request(baseURL + "/v2/coins", method: .get, parameters: parameters, encoder: .urlEncodedForm, headers: headers).responseDecodable(of: CoinResponse.self) { response in
            completion(response.result)
        }
    }
    
    func fetchCoin(limit: Int = 10, offset: Int, completion: @escaping (Result<CoinResponse, AFError>) -> Void) {
        URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
        let headers: HTTPHeaders = [
            "x-access-token": "coinranking05d52d3adfd70374eb462a8b63050f3a3651c9886bcf28d3"
        ]
        let parameters = [
            "limit": "\(limit)",
            "offset": "\(offset)"
        ]
        AF.request(baseURL + "/v2/coins", method: .get, parameters: parameters, encoder: .urlEncodedForm, headers: headers).responseDecodable(of: CoinResponse.self) { response in
            completion(response.result)
        }
        
    }
}
