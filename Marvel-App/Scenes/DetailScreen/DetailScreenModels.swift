//
//  DetailScreenModels.swift
//  Marvel-App
//
//  Created by Carles Grau Galvan on 12/05/2018.
//  Copyright (c) 2018 Carles Grau Galvan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Kingfisher

enum DetailScreen
{
    // MARK: Use cases
    
    enum SelectedCharacter{
        struct Request
        {
            var char: Character
        }
        struct Response
        {
            var name: String
            var thumbnailResource: ImageResource
            var description: String
        }
        struct ViewModel
        {
            var name: String
            var thumbnailResource: ImageResource
            var description: String?
        }
    }
    
    enum CollectionSettings{
        struct Request
        {
            var items: [Item]?
        }
        struct Response
        {
            var dataSource: ResourceCollectionDataSource
            var delegate: ResourceCollectionDelegate
        }
        struct ViewModel
        {
            var dataSource: ResourceCollectionDataSource
            var delegate: ResourceCollectionDelegate
        }
    }
}
