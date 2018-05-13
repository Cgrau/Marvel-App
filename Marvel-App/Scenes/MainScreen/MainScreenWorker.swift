//
//  MainScreenWorker.swift
//  Marvel-App
//
//  Created by Carles Grau Galvan on 11/05/2018.
//  Copyright © 2018 Carles Grau Galvan. All rights reserved.
//

import UIKit

import Alamofire
import CryptoSwift


class MainScreenWorker
{
    
    private let apiClient = APIClient()
    
    /// Worker will get Characters starting by searchString and will call APIClient to request to Marvel API.
    ///
    /// - Parameters:
    ///   - string: Search Characters starting by this parameter
    /// - Completion:
    ///   - entity: An array of characters
    ///   - error: -
    func search(string: String, completion: @escaping (_ entity: [Character]?, _ error: Error?)->Void) {
        apiClient.search(string: string) { (characters, error) in
            if let error = error {
                completion(nil, error)
            } else {
                completion(characters, nil)
            }
        }
    }
    
    /// Request to get Comic data.
    ///
    /// - Parameters:
    ///   - url: ComicURI
    /// - Completion:
    ///   - entity: Comic thumbnail URL with extension
    ///   - error: -
    func getComicThumbnailData(url: String, completion: @escaping (_ entity: String?, _ error: Error?)->Void){
        apiClient.getComicThumbnailData(url: url) { (imageURL, error) in
            if let error = error {
                completion(nil, error)
            } else {
                completion(imageURL, nil)
            }
        }
    }
}
