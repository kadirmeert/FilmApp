//
//  MovieModel.swift
//  FilmApp
//
//  Created by MERT on 26.07.2021.
//

import Foundation
import ObjectMapper

class MovieModel: Mappable {
    
    public var titleName: String = ""
    public var directorName: String = ""
    public var releasedate: String = ""
    public var imageName: String = ""
    public var likeNumber: String = ""
    
    required init?(map: Map) {
        if map.JSON["title"] == nil {
            return nil
        }
    }
    
    func mapping(map: Map) {
        titleName <- map["title"]
        directorName <- map["director"]
        releasedate <- map["release_date"]
    }
    
    
    
}

