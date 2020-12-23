//
//  CustomeImageView.swift
//  JSONTutorialFinal
//
//  Created by James Rochabrun on 4/3/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit
let imageCache = NSCache<NSString, UIImage>()
class CustomeImageView: UIImageView {
    var imageUrlString: String?
    func downloaded(from urlString: String, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        imageUrlString = urlString
        let url = URL(string: urlString)
        image = nil
        if let imageFromCache = imageCache.object(forKey: urlString as NSString ) {
            self.image = imageFromCache
            return
        }
        contentMode = mode
        URLSession.shared.dataTask(with: url!) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                let imageToCatche  = UIImage(data: data)
                if self?.imageUrlString == urlString{
                    self?.image = imageToCatche
                }
                imageCache.setObject(imageToCatche!, forKey: urlString as NSString)
            }
        }.resume()
    }
}

