//
//  DetailInteractor.swift
//  MoviesAppMV
//
//  Created by Abel Gonzalez on 21/11/23.
//

import Foundation

protocol DetailInteractable: AnyObject {
    func getDetailMovie(withId id: String) async -> DetailMovieEntity

}

class DetailInteractor: DetailInteractable {
    func getDetailMovie(withId id: String) async -> DetailMovieEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=1084b68fd870235cd7a3b51bf2ea5d91")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return try! jsonDecoder.decode(DetailMovieEntity.self, from: data)
    }
}
