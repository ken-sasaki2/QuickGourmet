//
//  FavoriteButton.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/22.
//

import SwiftUI

struct FavoriteButton: View {
    var action: () -> Void
    @State private var isFavorite = false

    var body: some View {
        Button(action: {
            action()
            isFavorite.toggle()
        }) {
            Text(isFavorite ? "保存済み" : "ブックマーク")
                .foregroundColor(ColorManager.white)
                .fontWeight(.medium)
                .font(.headline)
                .padding(.vertical, 10)
                .padding(.horizontal, 30)
                .background(isFavorite ? Color.gray : Color.red)
                .cornerRadius(100)
                .lineLimit(1)
        }
        .disabled(isFavorite)
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(action: {})
    }
}
