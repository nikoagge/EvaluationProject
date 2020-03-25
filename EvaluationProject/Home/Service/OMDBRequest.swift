//
//  OMDBRequest.swift
//  
//
//  Created by Nikolas on 23/3/20.
//


import Foundation


enum OMDBRequestError: Error {
    
    case noDataAvailable
    case canNotProcessData
}


struct OMDBRequest {
    
    let resourceURL: URL
    let apiKey = "3324604"
    
    init(movieTitle: String) {
        
        let resourceString =  "http://www.omdbapi.com/?i=tt3896198&apikey=\(apiKey)&s=\(movieTitle)"
        
        guard let resourceURL = URL(string: resourceString) else { fatalError() }
        
        self.resourceURL = resourceURL
    }
    
    
    func getMovies(completion: @escaping(Result<[SearchDetail], OMDBRequestError>) -> Void) {
        
        let _ = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            
            guard let jsonData = data else {
                
                completion(.failure(.noDataAvailable))
                
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                let search = try  decoder.decode(Search.self, from: jsonData)
                let searchDetails = search.Search
                completion(.success(searchDetails))
                
                
            } catch {
                completion(.failure(.canNotProcessData))
            }
        }.resume()
    }
}
