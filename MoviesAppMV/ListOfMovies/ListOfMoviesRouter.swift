//
//  ListOfMoviesRouter.swift
//  MoviesAppMV
//
//  Created by Abel Gonzalez on 23/06/23.
//

import Foundation
import UIKit

class ListOfMoviesRouter {
    func showListOfMovies(window: UIWindow?) {
        let view = ListOfMoviesView()
        let interactor = ListOfMoviesInteractor()
        let presenter = ListOfMoviesPresenter(lisOfMoviesInteractor: interactor)
        presenter.ui = view
        view.presenter = presenter
        
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
