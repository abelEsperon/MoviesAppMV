//
//  ListOfMoviesInteractor.swift
//  MoviesAppMV
//
//  Created by Abel Gonzalez on 23/06/23.
//

import Foundation

protocol ListOfMoviesInteractable: AnyObject {
    func getListOfMovies() async -> PopularMovieResponseEntity
}
    
class ListOfMoviesInteractor: ListOfMoviesInteractable {
    func getListOfMovies() async -> PopularMovieResponseEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=1084b68fd870235cd7a3b51bf2ea5d91")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
    }
}

class ListOfMoviesInteractorMock: ListOfMoviesInteractable {
    func getListOfMovies() async -> PopularMovieResponseEntity {
        return PopularMovieResponseEntity(results: [
            .init(id: 0, title: "MoviesApp", overview: "Practicando Swift", imageURL: "", votes: 10),
            .init(id: 1, title: "MoviesApp", overview: "Practicando Objetive-C", imageURL: "", votes: 10),
            .init(id: 2, title: "MoviesApp", overview: "Practicando Xcode", imageURL: "", votes: 10),
            .init(id: 3, title: "MoviesApp", overview: "Practicando SwiftUI", imageURL: "", votes: 10),
            .init(id: 4, title: "MoviesApp", overview: "Practicando C", imageURL: "", votes: 10),
            .init(id: 5, title: "MoviesApp", overview: "Practicando Firebase", imageURL: "", votes: 10),
            .init(id: 6, title: "MoviesApp", overview: "Practicando CoreData", imageURL: "", votes: 10),
        ])
    }
}
