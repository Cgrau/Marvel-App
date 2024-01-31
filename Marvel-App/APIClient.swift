//
//  Kingfisher+Marvel.swift
//  Marvel-App
//
//  Created by Carles Grau Galvan on 12/05/2018.
//  Copyright © 2018 Carles Grau Galvan. All rights reserved.
//

import Foundation
import Kingfisher
import Alamofire

fileprivate enum URLType: String {
    case image = "?"
    case `default` = "&"
}

private let portraitImageSize = "/portrait_xlarge."
private let landscapeImageSize = "/landscape_large."

final class APIClient {

    var baseURL = "https://gateway.marvel.com:443/v1/public/"
    let publicKey = "4b6904ea45800a7ce5c7d09c841cd51e"
    let privateKey = "a07365ea7e566693e58ae54f058281fe4c1f4a53"

    private lazy var configURL: String = {
        return "%@ts=%@&apikey=\(self.publicKey)&hash=%@"
    }()

    private lazy var apiConfig: String = {
        let ts = NSDate().timeIntervalSince1970.description
        let md5String: String = ts+privateKey+publicKey
        return String(format: configURL, "&", ts, md5String.md5())
    }()

    private func getLink(url: String, urlType: URLType) -> String {
        let ts = NSDate().timeIntervalSince1970.description
        let md5String: String = ts+privateKey+publicKey
        return String.init(format: url + configURL, urlType.rawValue, ts, md5String.md5())
    }

    func search(string: String, completion: @escaping (_ entity: [Character]?, _ error: Error?) -> Void) {
        let url = getLink(url: baseURL+"characters?nameStartsWith=\(string)&orderBy=name", urlType: .default)
        request(with: url, type: ServiceResponse<Character>.self) { (result, _) in
            return completion(result?.data?.results, nil)
        }
    }

    func getComicThumbnailData(url: String, completion: @escaping (_ entity: String?, _ error: Error?) -> Void) {
        let defURL = getLink(url: url, urlType: .image)
        request(with: defURL, type: ServiceResponse<Comic>.self) { (result, _) in
            guard let data = result?.data, let thumbnail = data.results![0].thumbnail else { return }
            let imageURL = thumbnail.path + portraitImageSize + thumbnail.thumbnailExtension
            return completion(imageURL, nil)
        }
    }

    private func request<T: Decodable>(with url: String, type: T.Type, completion: @escaping (_ result: T?, _ error: Error?) -> Void) {
        AF.request(url).responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let product = try decoder.decode(T.self, from: data)
                    return completion(product, nil)
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }

    static func getImageURL(downloadURL: String, extension: String) -> URL? {
        let path = downloadURL + landscapeImageSize + `extension`
        guard let url = URL(string: path) else { return nil }
        return url
    }
}
