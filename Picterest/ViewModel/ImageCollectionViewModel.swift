//
//  ImagesViewModel.swift
//  Picterest
//
//  Created by CHUBBY on 2022/07/27.
//

import UIKit

class ImageCollectionViewModel {
    private var pageNumber = 0
    private var images: [Image] = [] {
        didSet {
            collectionViewUpdate()
        }
    }
    var collectionViewUpdate: () -> Void = {}
    var imagesCount: Int {
        return images.count
    }
    
    private var isFetching = false
    
    func fetchImages() {
        NetworkManager.fetchImageList { [weak self] result in
            switch result {
            case .success(let images):
                self?.images.append(contentsOf: images)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func imageAtIndex(_ index: Int) -> ImageViewModel {
        return ImageViewModel(image: images[index])
    }
}

struct ImageViewModel {
    private let image: Image
    
    init(image: Image) {
        self.image = image
    }
    
    var id: String {
        return image.id
    }
    
    var width: Int {
        return image.width
    }
    
    var height: Int {
        return image.height
    }
    
    var url: String {
        return image.urls.thumb
    }
}
