//
//  MainScreenModels.swift
//  Marvel-App
//
//  Created by Carles Grau Galvan on 11/05/2018.
//  Copyright © 2018 Carles Grau Galvan. All rights reserved.
//

import UIKit

enum MainScreen
{
    // MARK: Use cases
    
    enum FetchItems
    {
        struct Request
        {
            var searchString: String
        }
        struct Response
        {
            var characters: [Character]
        }
        struct ViewModel
        {
            var displayedItems: [Character]
        }
    }
    enum AddFavorite {
        struct Request
        {
        }
        struct Response
        {
        }
        struct ViewModel
        {
        }
    }
    
    enum Detail {
        struct Request
        {
            var hero: Character
        }
        struct Response
        {
        }
        struct ViewModel
        {
        }
    }
}
