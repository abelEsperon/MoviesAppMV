//
//  PopularMovieResponseEntity.swift
//  MoviesAppMV
//
//  Created by Abel Gonzalez on 29/06/23.
//

import Foundation

struct PopularMovieResponseEntity: Decodable {
    let results: [PopularMovieEntity]
}
