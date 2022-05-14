//
//  Crypto_ListApp.swift
//  Crypto-List
//
//  Created by Phonthep Aungkanukulwit on 14/5/2565 BE.
//

import SwiftUI
import SDWebImage
import SDWebImageSVGCoder

@main
struct Crypto_ListApp: App {
    init() {
        setUpDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            CryptoListView()
        }
    }
}

private extension Crypto_ListApp {
    func setUpDependencies() {
        SDImageCodersManager.shared.addCoder(SDImageSVGCoder.shared)
    }
}
