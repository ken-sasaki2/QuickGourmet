//
//  FavoriteShopInfo.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/22.
//

import Foundation

struct FavoriteShop: Identifiable {
    var id = UUID()
    var name: String
    var address: String
    var mobileAccess: String
    var average: String
    var open: String
    var genreName: String
    var logoImage: String
    var photo: String
    var latitude: Double
    var longitude: Double
    var urlString: String
    var documentID: String?

    init(name: String, address: String, mobileAccess: String, average: String, open: String, genreName: String, logoImage: String, photo: String, latitude: Double, longitude: Double, urlString: String, documentID: String?) {
        self.name = name
        self.address = address
        self.mobileAccess = mobileAccess
        self.average = average
        self.open = open
        self.genreName = genreName
        self.logoImage = logoImage
        self.photo = photo
        self.latitude = latitude
        self.longitude = longitude
        self.urlString = urlString
        self.documentID = documentID
    }
}
