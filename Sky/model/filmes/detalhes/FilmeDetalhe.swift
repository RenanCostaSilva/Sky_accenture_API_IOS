//
//  FilmeDetalhe.swift
//  Sky
//
//  Created by Renan Silva on 17/10/23.
//

import Foundation

class FilmeDetalhe: Decodable , Identifiable {
    
    var id: Int
    var posterPath: String
    var backdropPath: String
    var title: String
    var overview: String
    
    
    init(id: Int, posterPath: String, backdropPath: String, title: String, overview: String) {
        self.id = id
        self.posterPath = posterPath
        self.backdropPath = backdropPath
        self.title = title
        self.overview = overview
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.posterPath = try container.decode(String.self, forKey: .posterPath)
        self.backdropPath = try container.decode(String.self, forKey: .backdropPath)
        self.title = try container.decode(String.self, forKey: .title)
        self.overview = try container.decode(String.self, forKey: .overview)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case title
        case overview
    }
    
}
