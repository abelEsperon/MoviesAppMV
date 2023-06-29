//
//  ListOfMoviesPresenter.swift
//  MoviesAppMV
//
//  Created by Abel Gonzalez on 23/06/23.
//

import Foundation

protocol ListOfMoviesUI: AnyObject {
    func update(movies: [PopularMovieEntity])
}

class ListOfMoviesPresenter {
    
    var ui: ListOfMoviesUI?
    private let lisOfMoviesInteractor: ListOfMoviesInteractor
    
    init(lisOfMoviesInteractor: ListOfMoviesInteractor) {
        self.lisOfMoviesInteractor = lisOfMoviesInteractor
    }
    
    func onViewApear() {
        Task {
            let models = await lisOfMoviesInteractor.getListOfMovies()
            ui?.update(movies: models.results)
        }
    }
}
