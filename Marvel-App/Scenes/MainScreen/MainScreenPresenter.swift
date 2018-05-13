//
//  MainScreenPresenter.swift
//  Marvel-App
//
//  Created by Carles Grau Galvan on 11/05/2018.
//  Copyright © 2018 Carles Grau Galvan. All rights reserved.
//

import UIKit

protocol MainScreenPresentationLogic {
    func presentSearchResults(response: MainScreen.FetchItems.Response)
}

class MainScreenPresenter: MainScreenPresentationLogic {
    weak var viewController: MainScreenDisplayLogic?

    /// MainScreenPresenter present characters to MainScreenViewController.
    ///
    /// - Parameters:
    ///   - response: FetchItems Response containing an array of characters.
    func presentSearchResults(response: MainScreen.FetchItems.Response) {
        let viewModel = MainScreen.FetchItems.ViewModel(displayedItems: response.characters)
        viewController?.displayFetchedItems(viewModel: viewModel)
    }
}
