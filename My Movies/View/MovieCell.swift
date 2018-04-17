//
//  MovieCell.swift
//  My Movies
//
//  Created by Manoj Kulkarni on 3/9/18.
//  Copyright © 2018 Manoj Kulkarni. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    var movieTitle: UILabel!
    var moviePoster: UIImageView!
    
    func setUpLayout(movieData: MovieData){
        //print(movieData.title)
        //self.contentView.backgroundColor = UIColor.darkGray
       movieTitle = UILabel(frame: CGRect(x: 120, y: 30, width: 300, height: 50))
       movieTitle.text = movieData.title
        movieTitle.textColor = UIColor.white
        movieTitle.font = UIFont.boldSystemFont(ofSize: 10)
        self.contentView.addSubview(movieTitle)
        
        moviePoster = UIImageView(frame: CGRect(x: 10, y: 15, width: 80, height: 80))
        downloadImage(imgUrl: movieData.posterPath)
        self.contentView.addSubview(moviePoster)
    }
   
    func downloadImage(imgUrl: String){
        if let urltoServer = URL.init(string: imgUrl){
            let task = URLSession.shared.dataTask(with: urltoServer, completionHandler: { (data, response, error) in
                if error != nil || data == nil{
                    //Error handler
                }
                else{
                    DispatchQueue.main.async {
                        self.moviePoster.image = UIImage(data: data!)
                    }
                   
                }
            })
            task.resume()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
         movieTitle.text = ""
        
        
    }

}
