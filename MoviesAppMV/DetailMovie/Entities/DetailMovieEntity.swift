//
//  DetailMovieEntity.swift
//  MoviesAppMV
//
//  Created by Abel Gonzalez on 21/11/23.
//

import Foundation

struct DetailMovieEntity: Decodable {
    let title: String
    let overview: String
    let backdropPath: String
    let status: String
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int
}
