//
//  ISO.swift
//  Sky
//
//  Created by Renan Silva on 17/10/23.
//

import Foundation

struct ReleaseDate: Decodable{
    
        let certification: String
        let descriptors: [String]
        let iso639_1: String
        let releaseDate: String

    init(certification: String, descriptors: [String], iso639_1: String, releaseDate: String) {
        self.certification = certification
        self.descriptors = descriptors
        self.iso639_1 = iso639_1
        self.releaseDate = releaseDate
    }
    
        enum CodingKeys: String, CodingKey {
            case certification, descriptors
            case iso639_1 = "iso_639_1"
            case releaseDate = "release_date"
        }
}
