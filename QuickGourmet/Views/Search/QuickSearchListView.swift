//
//  QuickSearchListView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/13.
//

import SwiftUI

struct QuickSearchListView: View {
    @ObservedObject var quickSearchVM: QuickSearchViewModel

    var body: some View {
        if quickSearchVM.shopData.count != 0 {
            List(quickSearchVM.shopData) { shop in
                NavigationLink(destination: ShopDetailView(shopData: shop)) {
                    QuickSearchListRowView(shopData: shop)
                }
            }
            .listStyle(PlainListStyle())
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor(ColorManager.baseColor)
                switch quickSearchVM.recordSearchListLaunchCount() {
                case true:
                    NendInterstitialView().showInterstitiaStillessAD()
                case false:
                    break
                }
            }
        } else {
            ZStack {
                ColorManager.gray.opacity(0.5)
                    .frame(width: 320, height: 45, alignment: .center)
                    .cornerRadius(10)
                Text("検索結果に該当するお店がありません")
                    .font(.custom(FontManager.Mplus.regular, size: 18))
            }
        }
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        QuickSearchListView(quickSearchVM: QuickSearchViewModel())
    }
}
