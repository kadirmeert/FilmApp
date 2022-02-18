//
//  MovieResponseModel.swift
//  FilmApp
//
//  Created by MERT on 2.08.2021.
//

import Foundation
import ObjectMapper

class MovieResponseModel: Mappable {
    
    public var results: [MovieModel] = [MovieModel]()
    
    required init?(map: Map) {
        if map.JSON["results"] == nil {
            return nil
        }
    }
    
    func mapping(map: Map) {
        results <- map["results"]
    }
    
    
    
}
