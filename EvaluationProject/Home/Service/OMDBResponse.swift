//
//  Response.swift
//  
//
//  Created by Nikolas on 23/3/20.
//


import Foundation


struct Search: Decodable {
    
    var Search: [SearchDetail]
}


struct SearchDetail: Decodable {
    
    var Title: String
    var Year: String
    var imdbID: String
    var Poster: String
}
