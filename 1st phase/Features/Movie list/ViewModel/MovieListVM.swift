//
//  MovieListVM.swift
//  1st phase
//
//  Created by SOL MAC 15 on 8/5/21.
//

import UIKit


class MovieListVM{
    
    var movieList:[Movie]?
    
    func getMarvelMovieList(vc:UIViewController, success:@escaping (_ :Bool)->Void) {

        Spinner.showSpinner(vc, nil)
        APICall.shared.getMovieListAPI { result in
            
            guard let movieListInfo = result else{
                success(false)
                Spinner.hideSpinner(nil)
                return
            }
            
            self.movieList = movieListInfo.results
            success(true)
            Spinner.hideSpinner(nil)
            
        }
    }
}
