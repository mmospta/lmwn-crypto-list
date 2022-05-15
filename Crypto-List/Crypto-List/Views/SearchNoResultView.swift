//
//  SearchNoResultView.swift
//  Crypto-List
//
//  Created by Phonthep Aungkanukulwit on 15/5/2565 BE.
//

import SwiftUI

struct SearchNoResultView: View {
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text("Sorry")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color.init(hex: "#333333"))
            Text("No result match this keyword")
                .font(.system(size: 16))
                .fontWeight(.regular)
                .foregroundColor(Color.init(hex: "#999999"))
            Spacer()
        }
    }
}

struct SearchNoResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchNoResultView()
            .previewLayout(.fixed(width: 330, height: 80))
    }
}
