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
    
    // MARK: - Business Logic
    func doSomeWork()
    {
        // NOTE: Do the work
    }
    
    func search(parameters: Array<String>, completionHandler: (()->Void)){
        
    }
    
    /// Worker will get Characters starting by searchString pushed. This view is normally presented with details of first request to API.
    ///
    /// - Parameters:
    ///   - view: Context which will be pushed.
    ///   - model: Data model for the context that will be pushed.
    func search(string: String, completion: @escaping (_ entity: [Character]?, _ error: Error?)->Void) {
        apiClient.search(string: string) { (characters, error) in
            if let error = error {
                completion(nil, error)
            } else {
                completion(characters, nil)
            }
        }
    }
    
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
