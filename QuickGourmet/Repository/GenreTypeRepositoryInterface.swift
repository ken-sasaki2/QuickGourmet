//
//  GenreTypeRepositoryInterface.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/09/04.
//

import Foundation

protocol GenreTypeRepositoryInterface {
    func getGenreCode(genre: GenreType) -> String
}
