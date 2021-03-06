//
//  SearchButton.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/22.
//

import SwiftUI

struct SearchButtonView: View {
    var text: String
    var tapAction: () -> Void

    var body: some View {
        Button(action: {
            tapAction()
        }) {
            Text(text)
                .foregroundColor(ColorManager.font_white)
                .font(.custom(FontManager.Mplus.medium, size: 18))
                .padding(.vertical, 10)
                .padding(.horizontal, 30)
                .background(ColorManager.mainColor)
                .cornerRadius(100)
                .lineLimit(1)
        }
    }
}

struct SearchButton_Previews: PreviewProvider {
    static var previews: some View {
        SearchButtonView(text: "検索") {}
    }
}
