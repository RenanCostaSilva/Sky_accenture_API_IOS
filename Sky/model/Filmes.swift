//
//  Filmes.swift
//  Sky
//
//  Created by Renan Silva on 16/10/23.
//

import Foundation

struct  Filmes: Decodable, Identifiable {
    
        var adult: Bool
        var backdropPath: String
        var id: Int
        var overview: String
        var posterPath, releaseDate, title: String

        
        init(adult: Bool , backdropPath: String , id: Int , overview: String ,  posterPath: String , releaseDate: String  ,title: String ){
            self.adult = adult
            self.backdropPath = backdropPath
            self.id = id
            self.overview = overview
            self.posterPath = posterPath
            self.releaseDate = releaseDate
            self.title = title
        }
    
        
            enum CodingKeys: String, CodingKey {
                case adult
                case backdropPath = "backdrop_path"
                case id
                case overview
                case posterPath = "poster_path"
                case releaseDate = "release_date"
                case title
            }
    
}
