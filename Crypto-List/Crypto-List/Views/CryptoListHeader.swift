//
//  CryptoListHeader.swift
//  Crypto-List
//
//  Created by Phonthep Aungkanukulwit on 15/5/2565 BE.
//

import SwiftUI

struct CryptoListHeader: View {
    var body: some View {
        Text("Buy, sell and hold crypto")
            .font(.system(size: 16))
            .fontWeight(.bold)
            .foregroundColor(.black)
            .background(.clear)
//            .padding(.horizontal, 8)
    }
}

struct CryptoListHeader_Previews: PreviewProvider {
    static var previews: some View {
        CryptoListHeader()
    }
}
