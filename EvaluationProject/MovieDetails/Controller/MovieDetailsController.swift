//
//  MovieDetailsController.swift
//  EvaluationProject
//
//  Created by Nikolas on 25/3/20.
//  Copyright © 2020 Nikolas Aggelidis. All rights reserved.
//


import UIKit


class MovieDetailsController: UIViewController {

    
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    
    var moviePosterImage: UIImage?
    var movieTitle: String?
    var movieYear: String?
    
    static let shared = MovieDetailsController()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureView()
    }

    
    func configureView() {
        
        self.moviePosterImageView.image = MovieDetailsController.shared.moviePosterImage
        self.movieTitleLabel.text = MovieDetailsController.shared.movieTitle
        self.movieYearLabel.text = MovieDetailsController.shared.movieYear
    }
}
