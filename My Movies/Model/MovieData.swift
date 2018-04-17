//
//  MovieData.swift
//  My Movies
//
//  Created by Manoj Kulkarni on 3/9/18.
//  Copyright © 2018 Manoj Kulkarni. All rights reserved.
//

import Foundation

class MovieData {
    
    private var _title: String!
    private var _vote: Double!
    private var _overview: String!
    private var _releaseDate: String!
    private var _posterPath: String!
    private var _genres = [Int!]()
    private var _backdropPath: String!
    
    
    var title: String {
        if _title == nil {
            return ""
        }
        return _title
    }
    
    var vote: Double {
        if _vote == nil {
            return 0.0
        }
        return _vote
    }
    
    var overview: String {
        if _overview == nil {
            return ""
        }
        return _overview
    }
    
    var releaseDate: String {
        if _releaseDate == nil {
            return ""
        }
        return _releaseDate
    }
    
    var posterPath: String {
        if _posterPath == nil {
            return ""
        }
        return _posterPath
    }
    
    var backdropPath: String {
        if _backdropPath == nil {
            return ""
        }
        return _backdropPath
    }
    
    var genres: [Int]{
        if _genres.count == 0{
            return [0]
        }
        return _genres
    }

    

    
    init(movieDataDict: Dictionary<String, AnyObject>) {
        
        if let vote = movieDataDict["vote_average"] as? Double {
            self._vote = vote
        }
        
        if let title = movieDataDict["original_title"] as? String {
            self._title = title
        }
        
        if let overview = movieDataDict["overview"] as? String {
            self._overview = overview
        }
        
        if let releasedate = movieDataDict["release_date"] as? String {
            self._releaseDate = releasedate
        }
        
        if let posterPath = movieDataDict["poster_path"] as? String {
            self._posterPath = "http://image.tmdb.org/t/p/original/\(posterPath)"
        }
        
        if let backdropPath = movieDataDict["backdrop_path"] as? String {
            self._backdropPath = "http://image.tmdb.org/t/p/original/\(backdropPath)"
        }
       
        if let genreIds = movieDataDict["genre_ids"] as? [Int] {
            self._genres = genreIds
        }
    
       
    }
    
}


