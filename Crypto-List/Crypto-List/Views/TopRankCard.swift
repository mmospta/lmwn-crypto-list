//
//  TopRankCard.swift
//  Crypto-List
//
//  Created by Phonthep Aungkanukulwit on 15/5/2565 BE.
//

import SwiftUI
import SDWebImageSVGCoder
import SDWebImageSwiftUI

struct TopRankCard: View {
    let coin: Coin
    
    var body: some View {
        VStack(spacing: 8) {
            WebImage(url: URL(string: coin.iconURL),
                     context: [.imageThumbnailPixelSize : CGSize.zero])
            .resizable()
            .frame(width: 40, height: 40)
            Text(coin.name)
                .font(.system(size: 16))
                .fontWeight(.bold)
                .lineLimit(1)
            Text(coin.symbol)
                .font(.system(size: 14))
                .fontWeight(.bold)
                .lineLimit(1)
                .foregroundColor(.gray)
            HStack(spacing: 2) {
                let change = Double(coin.change ?? "0") ?? 0
                if change >= 0 {
                    Image("GreenArrow")
                        .resizable()
                        .frame(width: 12, height: 12)
                    Text(coin.change ?? "0")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(Color.init(hex: "#13BC24"))
                } else {
                    Image("RedArrow")
                        .resizable()
                        .frame(width: 12, height: 12)
                    Text(coin.change ?? "0")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(Color.init(hex: "#F82D2D"))
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(Color.init(hex: "#F9F9F9"))
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}

struct TopRankCard_Previews: PreviewProvider {
    static var previews: some View {
        TopRankCard(coin: MockData.sampleCoin)
            .previewLayout(.fixed(width: 110, height: 140))
    }
}
