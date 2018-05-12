//
//  Kingfisher+Marvel.swift
//  Marvel-App
//
//  Created by Carles Grau Galvan on 12/05/2018.
//  Copyright © 2018 Carles Grau Galvan. All rights reserved.
//

import Foundation
import Kingfisher

private let worker = MainScreenWorker()

final class APIClient {
    static func getImageURL(downloadURL: String, extension: String) -> URL? {
        let path = downloadURL + "/portrait_xlarge." + `extension`
        guard let url = URL(string: path) else { return nil }
        return url
    }
}

extension Kingfisher {
    
//    public var kf: Kingfisher<Self> {
//        get {
//            return Kingfisher(self)
//            
//        }
//    }
//    
//    guard let url = APIClient.getImageURL(downloadURL: thumbnail.path, extension: thumbnail.thumbnailExtension) else { return }
//    let resource = ImageResource(downloadURL: url)
//    self.thumbnail.kf.setImage(with: resource)
}
