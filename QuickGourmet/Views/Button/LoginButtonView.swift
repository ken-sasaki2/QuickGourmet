//
//  LoginButton.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/18.
//

import SwiftUI

struct LoginButtonView: View {
    var tapAction = {}

    var body: some View {
        Button(action: {
            tapAction()
        }) {
            Text("ログイン")
                .foregroundColor(Color.white)
                .fontWeight(.medium)
                .font(.title3)
                .padding(.vertical, 10)
                .padding(.horizontal, 70)
                .background(Color.green)
                .cornerRadius(100)
                .lineLimit(1)
        }
    }
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonView()
    }
}