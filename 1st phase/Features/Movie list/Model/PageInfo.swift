//
//  PageInfo.swift
//  1st phase
//
//  Created by SOL MAC 15 on 8/5/21.
//

import Foundation

struct MovieListInfo: Codable {
    let page, total_pages, total_results: Int?
    let results: [Movie]?
    
    
    enum CodingKeys: String, CodingKey {
        case page, total_pages, total_results, results
    }
}

struct Movie:Codable {
    let backdrop_path,original_language,original_title,overview,poster_path,release_date,title :String?
    
    enum CodingKeys: String, CodingKey {
        case backdrop_path,original_language,original_title,overview,poster_path,release_date,title 
    }
}
