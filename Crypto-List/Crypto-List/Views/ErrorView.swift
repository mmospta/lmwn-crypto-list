//
//  ErrorView.swift
//  Crypto-List
//
//  Created by Phonthep Aungkanukulwit on 15/5/2565 BE.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var viewModel: CryptoListViewModel
    
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 4) {
                Text("Could not load data")
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                    .foregroundColor(Color.init(hex: "#333333"))
                Button {
                    viewModel.clearCoins()
                    viewModel.getCrytoCoin()
                } label: {
                    Text("Try again")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(Color.init(hex: "#38A0FF"))
                }
            }
            Spacer()
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(viewModel: CryptoListViewModel())
            .previewLayout(.fixed(width: 330, height: 80))
    }
}
