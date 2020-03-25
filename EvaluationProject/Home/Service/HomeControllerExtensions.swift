//
//  HomeControllerExtensions.swift
//  EvaluationProject
//
//  Created by Nikolas on 23/3/20.
//  Copyright © 2020 Nikolas Aggelidis. All rights reserved.
//


import UIKit


extension HomeController: UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    func createEmptyTableViewMessage(forHomeController homeController: HomeController) {
           
           let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height))
           let emptyTableViewMessageLabel = UILabel(frame: rect)
           emptyTableViewMessageLabel.text = "No movies found"
           emptyTableViewMessageLabel.textColor = .black
           emptyTableViewMessageLabel.textAlignment = .center
           emptyTableViewMessageLabel.font = UIFont(name: "TrebuchetMS", size: 17)
           emptyTableViewMessageLabel.sizeToFit()
           
           homeController.moviesTableView.backgroundView = emptyTableViewMessageLabel
           homeController.moviesTableView.separatorStyle = .none
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listOfMovies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let moviesTableViewCell = moviesTableView.dequeueReusableCell(withIdentifier: movieCellIdentifier, for: indexPath) as! MoviesTableViewCell
                   
            let posterURL = URL(string: listOfMovies[indexPath.row].Poster)
                  
            let data = try? Data(contentsOf: posterURL!)
        moviesTableViewCell.moviePosterImageView.image = UIImage(data: data!)
        moviesTableViewCell.movieNameLabel.text = listOfMovies[indexPath.row].Title
        moviesTableViewCell.movieYearLabel.text = listOfMovies[indexPath.row].Year
        moviesTableViewCell.accessoryType = .disclosureIndicator
        
        return moviesTableViewCell
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchBarText = searchBar.text else { return }
        
        let omdbRequest = OMDBRequest(movieTitle: searchBarText)
        omdbRequest.getMovies { [weak self] result in
            
            switch result {
                
            case .failure(let error):
                print(error)
                
            case .success(let movies):
                
                self?.listOfMovies = movies
            }
        }
    }
}
