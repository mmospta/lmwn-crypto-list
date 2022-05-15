//
//  CoinDetailView.swift
//  Crypto-List
//
//  Created by Phonthep Aungkanukulwit on 14/5/2565 BE.
//

import SwiftUI
import SDWebImageSVGCoder
import SDWebImageSwiftUI

struct CoinDetailView: View {
    @Binding var isShowingSheet: Bool
    
    let coin: Coin
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                VStack(alignment: .leading) {
                    HStack(alignment: .top, spacing: 16) {
                        WebImage(url: URL(string: coin.iconURL)!,
                                 context: [.imageThumbnailPixelSize : CGSize.zero])
                        .resizable()
                        .frame(width: 40, height: 40)
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text(coin.name)
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.init(hex: coin.color ?? "#333333"))
                                Text("(\(coin.symbol))")
                                    .font(.system(size: 18))
                                    .fontWeight(.regular)
                            }
                            HStack {
                                Text("PRICE")
                                    .font(.system(size: 12))
                                    .fontWeight(.bold)
                                Text(String(format: "$ %.2f", Double(coin.price) ?? 0))
                                    .font(.system(size: 12))
                                    .fontWeight(.regular)
                            }
                            HStack {
                                Text("MARKET CAP")
                                    .font(.system(size: 12))
                                    .fontWeight(.bold)
                                Text(String(format: "$ %.2f", Double(coin.marketCap) ?? 0))
                                    .font(.system(size: 12))
                                    .fontWeight(.regular)
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    
                    Text("No description")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(Color.init(hex: "#999999"))
                        .padding()
                    
                    Spacer()
                }
                Button {
                    print("dismiss")
                    isShowingSheet = false
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.init(hex: "#444444"))
                }
                .padding(16)
            }
            
            
            if let url = URL(string: coin.coinrankingURL),
               !coin.coinrankingURL.isEmpty {
                Divider()
                HStack {
                    Spacer()
                    Link("GO TO WEBSITE", destination: url)
                        .padding(.vertical, 16)
                    Spacer()
                }
            }
        }
    }
}

struct CoinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailView(isShowingSheet: .constant(true), coin: MockData.sampleCoin)
    }
}
