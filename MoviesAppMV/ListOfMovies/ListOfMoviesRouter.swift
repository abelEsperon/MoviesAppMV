//
//  ListOfMoviesRouter.swift
//  MoviesAppMV
//
//  Created by Abel Gonzalez on 23/06/23.
//

import Foundation
import UIKit

protocol ListOfMoviesRouting: AnyObject {
    var detailRouter: DetailRouting? { get }
    var listOfMoviesView: ListOfMoviesView? { get }
    
    func showListOfMovies(window: UIWindow?)
    func showDetailMoview(withMovieId movieId: String)
}

class ListOfMoviesRouter: ListOfMoviesRouting {
    var detailRouter: DetailRouting?
    var listOfMoviesView: ListOfMoviesView?
    
    func showListOfMovies(window: UIWindow?) {
        let interactor = ListOfMoviesInteractor()
        let presenter = ListOfMoviesPresenter(lisOfMoviesInteractor: interactor, router: self)
        
        listOfMoviesView = ListOfMoviesView(presenter: presenter)
        presenter.ui = listOfMoviesView
//        view.presenter = presenter
        
        window?.rootViewController = listOfMoviesView
        window?.makeKeyAndVisible()
    }
    
    func showDetailMoview(withMovieId movieId: String) {
        guard let fromViewController = listOfMoviesView else {
            return
        }
        detailRouter?.showDetail(fromViewController: fromViewController, withMovieId: movieId)
    }
}
