//
//  TopRankSectionHeader.swift
//  Crypto-List
//
//  Created by Phonthep Aungkanukulwit on 15/5/2565 BE.
//

import SwiftUI

struct TopRankSectionHeader: View {
    var body: some View {
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
    }
}

struct TopRankSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        TopRankSectionHeader()
    }
}
