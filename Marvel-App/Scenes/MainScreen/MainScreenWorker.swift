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
    let publicKey = "4b6904ea45800a7ce5c7d09c841cd51e"
    let privateKey = "a07365ea7e566693e58ae54f058281fe4c1f4a53"
    
    private let decoder = JSONDecoder()
    
    // MARK: - Business Logic
    func doSomeWork()
    {
        // NOTE: Do the work
    }
    
    func search(parameters: Array<String>, completionHandler: (()->Void)){
        
    }
    
    var apiConfig: String {
        let ts = NSDate().timeIntervalSince1970.description
        let md5String:String = ts+privateKey+publicKey
        return "&ts=\(ts)&apikey=\(publicKey)&hash=\(md5String.md5())"
    }
    
    func search(string: String, completion: @escaping (_ entity: [Character]?, _ error: Error?)->Void) {
        let url = "https://gateway.marvel.com:443/v1/public/characters?nameStartsWith=\(string)&orderBy=name" + apiConfig

        Alamofire.request(url).responseData { (response) in
            switch response.result {
            case .success:
                if let jsonData = response.result.value {
                    do {
                        let decoder = JSONDecoder()
                        let product = try decoder.decode(ServiceResponse<Character>.self, from: jsonData)
                        return completion(product.data?.results, nil)
                    } catch let error {
                        print(error)
                    }
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func getLink(url: String)->String{
        let ts = NSDate().timeIntervalSince1970.description
        var md5String:String = ts+privateKey+publicKey
        md5String = md5String.md5()
        return url + "?ts=\(ts)&apikey=\(publicKey)&hash=\(md5String)"
    }
    
    func getComicThumbnailData(url: String, completion: @escaping (_ entity: String?, _ error: Error?)->Void){
        let defURL = getLink(url: url)
        
        Alamofire.request(defURL).responseData { (response) in
            switch response.result {
            case .success:
                if let jsonData = response.result.value {
                    do {
                        let decoder = JSONDecoder()
                        let responseModel = try decoder.decode(ServiceResponse<Comic>.self, from: jsonData)
                        guard let data = responseModel.data, let thumbnail = data.results![0].thumbnail else { return }
                        let imageURL = thumbnail.path + "/portrait_xlarge." + thumbnail.thumbnailExtension
                        return completion(imageURL, nil)
                    } catch let error {
                        print(error)
                    }
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
