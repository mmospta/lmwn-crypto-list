//
//  InviteFriendsView.swift
//  Crypto-List
//
//  Created by Phonthep Aungkanukulwit on 16/5/2565 BE.
//

import SwiftUI

struct InviteFriendsView: View {
    var body: some View {
        HStack {
            HStack(spacing: 16) {
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                    Image("GiftIcon")
                        .resizable()
                        .frame(width: 22, height: 22)
                }
                Text("You can earn $10  when you invite a friend to buy crypto. ")
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                + Text("[Invite your friend](https://careers.lmwn.com)")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(colorBlue)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 21)
        .background(colorLightBlue)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}

struct InviteFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        InviteFriendsView()
            .previewLayout(.fixed(width: 360, height: 82))
    }
}
