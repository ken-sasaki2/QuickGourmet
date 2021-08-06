//
//  QuickSearchView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/02.
//

import CoreLocation
import SwiftUI

struct QuickSearchView: View {
    @State private var isTapActive = false
    @State private var isShowsAlert = false
    @State private var isShowsPopUp = false
    @State var searchVM = SearchViewModel()
    private let quickSearchVM = QuickSearchViewModel()
    private let userDefaultsDataStore = UserDefaultsDataStore()
    private let locationManager = CLLocationManager()

    private let quickSearchImages = ["food_izakaya", "food_baru", "food_sousaku", "food_wasyoku", "food_yosyoku", "food_italia", "food_tyuka", "food_yakiniku", "food_asia", "food_kakukoku", "food_karaoke", "food_bar", "food_ramen", "food_cafe", "food_other", "food_okonomiyaki", "food_korea"]

    let quickSearchTextes = ["居酒屋", "ダイニングバー・バル", "創作料理", "和食", "洋食", "イタリアン・フレンチ", "中華", "焼肉・ホルモン", "アジア・エスニック料理", "各国料理", "カラオケ・パーティ", "バー・カクテル", "ラーメン", "カフェ・スイーツ", "その他グルメ", "お好み焼き・もんじゃ", "韓国料理"]

    // searchTODO: 距離指定ではなく徒歩００分で指定させる

    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    ZStack {
                        VStack(spacing: 10) {
                            ForEach(0 ..< quickSearchImages.count) { index in
                                NavigationLink(destination: SearchListView(quickSearchVM: quickSearchVM), isActive: $isTapActive) {}
                                Button(action: {
                                    switch locationManager.authorizationStatus {
                                    case .notDetermined: // 許諾とっていない
                                        isShowsAlert = true
                                    case .denied: // 許可されていない
                                        isShowsAlert = true
                                    default:
                                        isShowsAlert = false
                                        withAnimation(.linear(duration: 0.3)) {
                                            isShowsPopUp = true
                                        }
                                        // isTapActive = true
                                    }
                                }) {
                                    QuickSearchRowView(imageString: quickSearchImages[index], genreName: quickSearchTextes[index])
                                }
                                .alert(isPresented: $isShowsAlert) {
                                    Alert(title: Text("確認"), message: Text("位置情報を許可してください"), dismissButton: .default(Text("OK")) {
                                        quickSearchVM.goToLocationSetting()
                                    })
                                }
                            }
                            .edgesIgnoringSafeArea(.bottom)
                        }
                    }
                    .navigationTitle("食いっくグルメ")
                }
                PopupWindowView(show: $isShowsPopUp)
            }
        }
    }

    func communicateQuickSearchVM(index: Int) {
        quickSearchVM.latitude = userDefaultsDataStore.latitudeInformation
        quickSearchVM.longitude = userDefaultsDataStore.longitudeInformation
        quickSearchVM.genreIndex = index
        quickSearchVM.callShopSearchFetcher()
    }
}

struct QuickSearchView_Previews: PreviewProvider {
    static var previews: some View {
        QuickSearchView()
    }
}