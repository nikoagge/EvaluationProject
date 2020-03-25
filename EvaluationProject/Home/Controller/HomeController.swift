//
//  HomeController.swift
//  EvaluationProject
//
//  Created by Nikolas on 23/3/20.
//  Copyright © 2020 Nikolas Aggelidis. All rights reserved.
//

import UIKit


class HomeController: UIViewController {

    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var moviesTableView: UITableView!
    
    var listOfMovies = [SearchDetail]() {
        
        didSet {
            
            DispatchQueue.main.async {
                
                self.moviesTableView.reloadData()
                
                self.navigationItem.title = "\(self.listOfMovies.count) Movies found"
            }
        }
    }
    
    let movieCellIdentifier = "movieCell"
    let segueToMovieDetailsStoryboardIdentifier = "segueToMovieDetailsStoryboardIdentifier"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueToMovieDetailsStoryboardIdentifier {
            
//            if let indexPath = self.moviesTableView.indexPathForSelectedRow {
//
//                let movieDetails = listOfMovies[indexPath.row]
//
//                (segue.destination as! MovieDetailsController).movieDetails = movieDetails
//            }
            
            
            if let indexPath = self.moviesTableView.indexPathForSelectedRow {
                
                let posterURL = URL(string: listOfMovies[indexPath.row].Poster)
                          
                    let data = try? Data(contentsOf: posterURL!)
//                MovieDetailsController.shared.moviePosterImageView.image = UIImage(data: data!)
                MovieDetailsController.shared.moviePosterImage = UIImage(data: data!)
                MovieDetailsController.shared.movieTitle = listOfMovies[indexPath.row].Title
                MovieDetailsController.shared.movieYear = listOfMovies[indexPath.row].Year
            }
        }
    }
}
