//
//  ViewController.swift
//  My Movies
//
//  Created by Manoj Kulkarni on 3/9/18.
//  Copyright © 2018 Manoj Kulkarni. All rights reserved.
//

import UIKit
import Foundation


class HomeVC: UITableViewController {
    
    var movieArray = [MovieData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "My Movies"
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.register(MovieCell.self, forCellReuseIdentifier: "moviecell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        let urlTMDB = "http://api.themoviedb.org/3/movie/top_rated?api_key=ad7ef195f48f2eb891e6f75107fef10f"
        fetchData(url: urlTMDB)
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.tableView.dequeueReusableCell(withIdentifier: "moviecell", for: indexPath) as? MovieCell{
            if indexPath.row%2 == 0{
                cell.backgroundColor = UIColor.gray
            }
            else{
                cell.backgroundColor = UIColor.darkGray
            }
        cell.setUpLayout(movieData: self.movieArray[indexPath.row])
        return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let detailVC = DetailVC()
        detailVC.movieData = self.movieArray[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    func fetchData(url: String){

        if let urlToServer = URL.init(string: url) {
            let task = URLSession.shared.dataTask(with: urlToServer, completionHandler: { (data, response, error) in

                if error != nil || data == nil{
                    //Error handler
                }

                else{
                    
                    if let jsonObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? Dictionary<String, AnyObject> {
                        if let resultsArr = jsonObject!["results"] as? [Dictionary<String, AnyObject>]{
                           
                            
                            for obj in resultsArr{
                                //print(obj)
                                //print("#####################################################################")
                                let movie = MovieData(movieDataDict: obj)
                                self.movieArray.append(movie)
                                
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                    
                                }
                               
                            }
                        
                        }
                     

                    }
                }
               
                
            })
            task.resume()
            
        }
    }

}

