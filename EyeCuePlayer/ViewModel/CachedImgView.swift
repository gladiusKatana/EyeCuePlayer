// eyeCuePlayer ･ CacheableImgView.swift
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()          //Not an extension (?)

class CachedImgView: UIImageView {
    
    var imageUrlString: String?
    func loadImageUsingUrlString(_ urlString: String) {   //(Called in VideoCell)
        
        imageUrlString = urlString
        let url = URL(string: urlString)

        image = UIImage(named: "brokenGlassIcon")
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url!, completionHandler:
            { (data, respones, error) in
                
                if error != nil {
                    print(error as Any)
                    return
                }
                
                DispatchQueue.main.async(execute: {
                    
                    let imageToCache = UIImage(data: data!)
                    
                    if self.imageUrlString == urlString {
                        self.image = imageToCache
                    }
                    imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
                })
        }).resume()
    }
}

