//
//  Extensions.swift
//  Synapse
//
//  Created by Allison Trager on 3/23/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import Foundation
import UIKit

//image url : a ui image
var imageCache = [String: UIImage]()

extension UIImageView {
    func loadImage(with urlString: String) {
        
        //check if image exists in cache
        if let cachedImage = imageCache[urlString] {
            self.image = cachedImage
            return
        }
        
        // if image does not exist in cache
        
        // url for image location
        guard let url = URL(string: urlString) else {return}
        
        //fetch contents of URL
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Failed to load image with error", error.localizedDescription)
            }
            
            //image data
            guard let imageData = data else { return }
            
            // create image using image data
            let photoImage = UIImage(data: imageData)
            
            // set key and value for image cache
            imageCache[url.absoluteString] = photoImage
            
            // set image
            DispatchQueue.main.async {
                self.image = photoImage
            }
        }.resume()
    }
}
