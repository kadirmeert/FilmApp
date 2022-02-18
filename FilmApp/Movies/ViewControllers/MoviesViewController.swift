//
//  MoviesViewController.swift
//  FilmApp
//
//  Created by MERT on 26.07.2021.
//

import Alamofire
import AlamofireObjectMapper
import UIKit
import JGProgressHUD


class MoviesViewController: UIViewController {
   
    // MARK: Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Properties
    
    var movieList = [MovieModel]()
    var originalMovieList = [MovieModel]()
    let hud = JGProgressHUD()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.searchBar.delegate = self
        if self.originalMovieList.isEmpty {
            hud.textLabel.text = "Loading"
            hud.show(in: self.view)
            self.getMovieList()
        }
        
       
    }
    
    func getMovieList() {
        
        
        Alamofire.request("https://swapi.dev/api/films", method: .get, parameters: nil, encoding: URLEncoding(destination: .queryString), headers: nil).responseObject{(response: DataResponse<MovieResponseModel>) in
            
            if let movieResponse = response.result.value {
                self.movieList = movieResponse.results
                self.updateMovieList()
            } else {
               
            }
        }
    }
    
    func updateMovieList() {
        var index = 0
        for movie in self.movieList {
            if index == 0 {
                movie.likeNumber = "344"
                movie.imageName = "movie0"
            } else if index == 1 {
                movie.likeNumber = "224"
                movie.imageName = "movie1"
            } else if index == 2 {
                movie.likeNumber = "423"
                movie.imageName = "movie2"
            }else if index == 3 {
                movie.likeNumber = "335"
                movie.imageName = "movie3"
            }else if index == 4 {
                movie.likeNumber = "763"
                movie.imageName = "movie4"
            }else if index == 5 {
                movie.likeNumber = "655"
                movie.imageName = "movie5"
            }
            index += 1
        }
        
        self.originalMovieList = self.movieList
        hud.dismiss()
        self.collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let detailVC = segue.destination as? MovieDetailViewController {
                if let movie = sender as? MovieModel {
                    detailVC.selectedMovie = movie
                }
            }
        }
    }
}

extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movieCell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MoviesCollectionViewCell
        let selectedMovie = self.movieList[indexPath.item]
        movieCell.prepareCell(movie: selectedMovie)
        return movieCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovie = self.movieList[indexPath.item]
        self.performSegue(withIdentifier: "showDetail" , sender: selectedMovie)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 2) - 8, height: 170)
    }
}
extension MoviesViewController: UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.endEditing(true)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("search = \(searchText)" )
        
        if searchText == "" {
            self.movieList = self.originalMovieList
        } else {
            self.movieList = searchText.isEmpty ? movieList: movieList.filter({(model) -> Bool in return model.titleName.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil })
        }
        self.collectionView.reloadData()
    }
}

