//
//  MainScreenInteractor.swift
//  Marvel-App
//
//  Created by Carles Grau Galvan on 11/05/2018.
//  Copyright © 2018 Carles Grau Galvan. All rights reserved.
//

import UIKit

protocol MainScreenBusinessLogic {
    func search(request: MainScreen.FetchItems.Request)
}

protocol MainScreenDataStore {
    var characters: [Character]? { get }
}

class MainScreenInteractor: MainScreenBusinessLogic, MainScreenDataStore {
    var presenter: MainScreenPresentationLogic?
    var worker: MainScreenWorker?
    var characters: [Character]?

    /// Uses worker to get Characters from MainScreenWorkes(search:) and pass data to presenter
    ///
    /// - Parameters:
    ///   - string: Search Characters starting by this parameter
    func search(request: MainScreen.FetchItems.Request) {
        worker = MainScreenWorker()
        worker?.search(string: request.searchString, completion: { (results, error) in
            guard error == nil else { return }
            self.characters = results
            guard let chars = self.characters else { return }
            let response = MainScreen.FetchItems.Response(characters: chars)
            self.presenter?.presentSearchResults(response: response)
        })
    }
}
