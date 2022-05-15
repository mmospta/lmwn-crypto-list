//
//  TopRankView.swift
//  Crypto-List
//
//  Created by Phonthep Aungkanukulwit on 15/5/2565 BE.
//

import SwiftUI

struct TopRankView: View {
    @StateObject var viewModel: CryptoListViewModel
    
    let columnSpacing: CGFloat = 8
    var gridLayout: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: columnSpacing), count: 3)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Top ")
                .font(.system(size: 18))
                .fontWeight(.bold)
                .foregroundColor(Color.init(hex: "#333333"))
            + Text("3 ")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color.init(hex: "#C52222"))
            + Text("rank ")
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .foregroundColor(Color.init(hex: "#333333"))
            + Text("crypto")
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .foregroundColor(Color.init(hex: "#333333"))
            
            LazyVGrid(columns: gridLayout) {
                ForEach(viewModel.coins, id: \.rank) { coin in
                    if coin.rank <= 3 {
                        TopRankCard(coin: coin)
                    }
                }
            }
        }
    }
}

struct TopRankView_Previews: PreviewProvider {
    static var previews: some View {
        TopRankView(viewModel: CryptoListViewModel())
    }
}
