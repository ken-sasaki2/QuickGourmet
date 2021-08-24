//
//  FavoriteViewModel.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/22.
//

import Foundation

class FavoriteViewModel: ObservableObject {
    @Published var favoriteShopData = [FavoriteShop]()
    private let favoriteRepository = FavoriteRepository()
    // var favoriteShopInfo: FavoriteShopInfo?

    func saveFavoriteShop(favoriteShop: FavoriteShop) {
        favoriteRepository.saveFavoriteShopData(favoriteShop: favoriteShop)
    }

    func getFavoriteShop() {
        favoriteRepository.getFavoriteShopData { shopes in
            self.favoriteShopData = shopes
            print("kenken", self.favoriteShopData)
        }
    }
}