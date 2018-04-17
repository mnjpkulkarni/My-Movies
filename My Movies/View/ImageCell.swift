//
//  ImageCell.swift
//  My Movies
//
//  Created by Manoj Kulkarni on 3/16/18.
//  Copyright © 2018 Manoj Kulkarni. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    var img: UIImageView!
    
    func configureCell(imgStr: String){
        print(imgStr)
        img = UIImageView(frame: CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height))
        img.contentMode = .scaleAspectFit
        downloadImg(imgUrl: imgStr)
        self.contentView.addSubview(img)
    }
    
    func downloadImg(imgUrl: String){
        
        if let urltoServer = URL.init(string: imgUrl){
            let task = URLSession.shared.dataTask(with: urltoServer, completionHandler: { (data, response, error) in
                if error != nil || data == nil{
                    //Error handler
                }
                else{
                    DispatchQueue.main.async {
                        self.img.image = UIImage(data: data!)
                    }
                    
                }
            })
            task.resume()
        }
        
    }
    
}
