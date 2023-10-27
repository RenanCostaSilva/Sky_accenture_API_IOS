//
//  MovieList.swift
//  Sky
//
//  Created by Renan Silva on 16/10/23.
//

import UIKit
struct MovieList:  Decodable {
    
    let movies: [Filmes]
    
    private enum CodingKeys: String , CodingKey {
            case movies = "results"
        }
    
}
