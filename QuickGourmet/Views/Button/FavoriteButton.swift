//
//  FavoriteButton.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/22.
//

import SwiftUI

struct FavoriteButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            Image(systemName: "star")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.gray)
                .padding(.leading, 30)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(action: {})
    }
}
