//
//  ListOfMoviesPresenter.swift
//  MoviesAppMV
//
//  Created by Abel Gonzalez on 23/06/23.
//

import Foundation

protocol ListOfMoviesPresentable: AnyObject {
    var ui: ListOfMoviesUI? { get }
    var viewModels: [ViewModel] { get }
    
    func onViewApear()
    func onTapCell(atIndex: Int)
}

protocol ListOfMoviesUI: AnyObject {
    func update(movies: [ViewModel])
}

class ListOfMoviesPresenter: ListOfMoviesPresentable {
    weak var ui: ListOfMoviesUI?
    
    private let lisOfMoviesInteractor: ListOfMoviesInteractable
    var viewModels: [ViewModel] = []
    private var models: [PopularMovieEntity] = []
    private let mapper: Mapper
    private let router: ListOfMoviesRouting
    
    init(lisOfMoviesInteractor: ListOfMoviesInteractable, mapper: Mapper = Mapper(), router: ListOfMoviesRouting) {
        self.lisOfMoviesInteractor = lisOfMoviesInteractor
        self.mapper = mapper
        self.router = router
    }
    
    func onViewApear() {
        Task {
            models = await lisOfMoviesInteractor.getListOfMovies().results
            viewModels = models.map(mapper.map(entity:))
            ui?.update(movies: viewModels)
        }
    }
    
    func onTapCell(atIndex: Int) {
        let movieId = models[atIndex].id
        print(movieId)
        router.showDetailMoview(withMovieId: movieId.description)
    }
    
}
