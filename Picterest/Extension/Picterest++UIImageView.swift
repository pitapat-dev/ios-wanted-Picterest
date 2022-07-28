//
//  Picterest++UIImageView.swift
//  Picterest
//
//  Created by CHUBBY on 2022/07/27.
//

import UIKit

extension UIImageView {
    
    func loadImage(url: String) {
        let key = NSString(string: url)
        if let cachedImage = ImageCacheManager.shared.object(forKey: key) {
            self.image = cachedImage
            print("from cache")
            return
        }
            
        NetworkManager.shared.fetchImage(url: url) { image in
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
