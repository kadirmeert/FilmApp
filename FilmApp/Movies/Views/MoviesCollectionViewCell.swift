//
//  MoviesCollectionViewCell.swift
//  FilmApp
//
//  Created by MERT on 26.07.2021.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeNumberCount: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var innerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.innerView.dropShadow(cornerRadius: 5)
        
    }
    
    func prepareCell(movie: MovieModel) {
        self.titleLabel.text = movie.titleName
        self.likeNumberCount.text = movie.likeNumber
        self.directorLabel.text = movie.directorName
        self.logoImageView.image = UIImage(named: movie.imageName)
        self.dateLabel.text = movie.releasedate.changeDateFormat()
        

    }
    
}
