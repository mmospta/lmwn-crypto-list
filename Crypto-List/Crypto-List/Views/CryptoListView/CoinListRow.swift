//
//  CoinListCell.swift
//  Crypto-List
//
//  Created by Phonthep Aungkanukulwit on 14/5/2565 BE.
//

import SwiftUI
import SDWebImageSVGCoder
import SDWebImageSwiftUI

struct CoinListRow: View {
    
    let coin: Coin
    
    var body: some View {
        HStack {
            HStack(spacing: 16) {
                WebImage(url: URL(string: coin.iconURL),
                         context: [.imageThumbnailPixelSize : CGSize.zero])
                .resizable()
                .frame(width: 40, height: 40)
                VStack(alignment: .leading, spacing: 6) {
                    Text(coin.name)
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .lineLimit(1)
                    Text(coin.symbol)
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                }
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 8) {
                Text(String(format: "$ %.4f", Double(coin.price ?? "0") ?? 0))
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .foregroundColor(Color.init(hex: "#333333"))
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
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 21)
        .background(Color.init(hex: "#F9F9F9"))
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}

struct CoinListCell_Previews: PreviewProvider {
    static var previews: some View {
        CoinListRow(coin: MockData.sampleCoin)
            .previewLayout(.fixed(width: 360, height: 82))
    }
}
