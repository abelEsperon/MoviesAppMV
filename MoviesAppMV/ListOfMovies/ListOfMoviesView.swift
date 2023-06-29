//
//  ListOfMoviesView.swift
//  MoviesAppMV
//
//  Created by Abel Gonzalez on 23/06/23.
//

import Foundation
import UIKit
// API key   1084b68fd870235cd7a3b51bf2ea5d91
// https://api.themoviedb.org/3/movie/popular

class ListOfMoviesView: UIViewController {
    var presenter: ListOfMoviesPresenter?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(code:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        presenter?.onViewApear()
    }
    
}

extension ListOfMoviesView: ListOfMoviesUI {
    func update(movies: [PopularMovieEntity]) {
        print("Datos recibidos \(movies)")
    }
}
