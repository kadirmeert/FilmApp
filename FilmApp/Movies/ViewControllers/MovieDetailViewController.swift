//
//  MovieDetailViewController.swift
//  FilmApp
//
//  Created by MERT on 26.07.2021.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var introback: UIImageView!
    @IBOutlet weak var viewlike: UIView!
    @IBOutlet weak var likelabel: UILabel!
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var directorlabel: UILabel!
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var likestack: UIView!
    @IBOutlet weak var datestack: UIView!
    @IBOutlet weak var directorstack: UIView!

    
    //MARK: Properties
    
    var selectedMovie = MovieModel(JSON: ["" : ""])
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.prepareUI()
    }
    
    func prepareUI() {
        self.likestack.dropShadow(cornerRadius: 7)
        self.datestack.dropShadow(cornerRadius: 7)
        self.directorstack.dropShadow(cornerRadius: 7)
        
        self.titleLabel.text = self.selectedMovie?.titleName
        self.movieImage.image = UIImage(named: self.selectedMovie!.imageName)
        self.likelabel.text = self.selectedMovie?.likeNumber
        self.datelabel.text = self.selectedMovie?.releasedate.changeDateFormat()
        self.directorlabel.text = self.selectedMovie?.directorName
        
    }
    
}
