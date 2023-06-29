//
//  ListOfMoviesInteractor.swift
//  MoviesAppMV
//
//  Created by Abel Gonzalez on 23/06/23.
//

import Foundation

class ListOfMoviesInteractor {
    func getListOfMovies() async -> PopularMovieResponseEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=1084b68fd870235cd7a3b51bf2ea5d91")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
    }
}
