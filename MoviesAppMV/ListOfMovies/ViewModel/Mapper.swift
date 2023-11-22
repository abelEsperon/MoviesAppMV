//
//  Mapper.swift
//  MoviesAppMV
//
//  Created by Abel Gonzalez on 04/07/23.
//

import Foundation

struct Mapper {
    func map(entity: PopularMovieEntity) -> ViewModel {
        ViewModel(title: entity.title,
                  overview: entity.overview,
                  imageURL: URL(string: "https://image.tmdb.org/t/p/w200" + entity.imageURL))
    }
}
