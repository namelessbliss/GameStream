//
//  Model.swift
//  GameStream
//
//  Created by adolfo pardo on 5/09/22.
//

import Foundation

struct Games:Codable {
    
    var games:[Game]
    
}

struct Game:Codable{
    
    var title:String
    var studio:String
    var contentRating:String
    var publicationYear:String
    var description:String
    var platforms:[String]
    var tags:[String]
    var videosUrls:videoUrl
    var galleryImages:[String]
    
}

struct videoUrl:Codable{
    
    var mobile:String
    var tablet:String
    
}
