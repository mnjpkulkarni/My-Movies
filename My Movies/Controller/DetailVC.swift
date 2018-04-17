//
//  DetailVC.swift
//  My Movies
//
//  Created by Manoj Kulkarni on 3/16/18.
//  Copyright © 2018 Manoj Kulkarni. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {

    var movieData: MovieData!
    
    var titleLbl: UILabel!
    var posterImg: UIImage!
    var overviewLbl: UILabel!
    var releaseDateLbl: UILabel!
    var genreLbl: UILabel!

    var stackView: UIStackView!
    
    var ratingsView: CosmosView!
    
    var imgArray = [String]()
    
    var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imgArray.append(movieData.posterPath)
        self.imgArray.append(movieData.backdropPath)
        
       
        self.view.backgroundColor = UIColor.gray
        
        setUpLayout()
    }
    
    
    func setUpLayout(){
        
        
        titleLbl = UILabel(frame: CGRect(x: 10, y: 90, width: 300, height: 60))
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.text = movieData.title
        titleLbl.textAlignment = .left
        titleLbl.textColor = UIColor.white
        titleLbl.font = UIFont.boldSystemFont(ofSize: 13)
        self.view.addSubview(titleLbl)

        overviewLbl = UILabel(frame: CGRect(x: 10, y: 150, width: self.view.frame.width - 10, height: 120))
        overviewLbl.translatesAutoresizingMaskIntoConstraints = false
        overviewLbl.text = movieData.overview
        overviewLbl.textAlignment = .left
        overviewLbl.numberOfLines = 8
        overviewLbl.textColor = UIColor.white
        overviewLbl.font = UIFont.italicSystemFont(ofSize: 12)
        self.view.addSubview(overviewLbl)
        

        ratingsView = CosmosView(frame: CGRect(x: 10, y: 270, width: 400, height: 50))
        self.view.addSubview(ratingsView)
        ratingsView.translatesAutoresizingMaskIntoConstraints = false
        ratingsView.rating = (movieData.vote)/2
        ratingsView.settings.fillMode = .precise
        self.view.addSubview(ratingsView)
        
        releaseDateLbl = UILabel(frame: CGRect(x: 10, y: 320, width: 400, height: 50))
        releaseDateLbl.textColor = UIColor.white
        releaseDateLbl.font = UIFont.monospacedDigitSystemFont(ofSize: 15, weight: UIFont.Weight(rawValue: 15))
        releaseDateLbl.textAlignment = .left
        releaseDateLbl.text = "Release date: \(movieData.releaseDate)"
        self.view.addSubview(releaseDateLbl)
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 50, left: 10, bottom: 10, right: 10)
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 390, width: view.frame.width, height: 200), collectionViewLayout: layout)
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "imageCell")
        layout.minimumLineSpacing = 0
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = false
        self.view.addSubview(collectionView)
//
//
//        stackView = UIStackView()
//        self.view.addSubview(stackView)
//        stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10).isActive = true
//        stackView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
//        stackView.heightAnchor.constraint(equalToConstant: 300).isActive = true
//        stackView.axis = .vertical
//        stackView.distribution = .fillProportionally
//        stackView.spacing = 10
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//
//        stackView.addArrangedSubview(titleLbl)
//        stackView.addArrangedSubview(overviewLbl)
//        stackView.addArrangedSubview(ratingsView)
//        stackView.addArrangedSubview(releaseDateLbl)
        
        
        
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCell
        if indexPath.row % 2 == 0{
            cell.configureCell(imgStr: movieData.posterPath)
        }
        else {
        cell.configureCell(imgStr: movieData.backdropPath)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let itemWidth = collectionView.bounds.width
    let itemHeight = collectionView.bounds.height
    return CGSize(width: itemWidth, height: itemHeight)

    }
    

}
