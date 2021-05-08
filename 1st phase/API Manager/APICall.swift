//
//  APICall.swift
//  1st phase
//
//  Created by SOL MAC 15 on 9/5/21.
//

import Foundation


class APICall {
    
   static var shared = APICall()
    
    let session = URLSession.shared
    let url = URL(string: movieUrl)!

    
      func getMovieListAPI(movieList:@escaping (_ success:MovieListInfo?) -> Void ) {
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            
            if error == nil{
                print("no error")
            }
            
            do{
                let json = try JSONDecoder().decode(MovieListInfo.self, from: data! )
                movieList(json)
                print(json)
            }catch{
                movieList(nil)
                print("JSON decoding problem: \(error.localizedDescription)")
            }
            
            })
            task.resume()
    }
}
