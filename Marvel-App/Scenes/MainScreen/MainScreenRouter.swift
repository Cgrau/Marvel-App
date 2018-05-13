//
//  MainScreenRouter.swift
//  Marvel-App
//
//  Created by Carles Grau Galvan on 11/05/2018.
//  Copyright © 2018 Carles Grau Galvan. All rights reserved.
//

import UIKit

@objc protocol MainScreenRoutingLogic
{
    func passDataToCharacterDetail()
}

protocol MainScreenDataPassing
{
    var dataStore: MainScreenDataStore? { get }
}

class MainScreenRouter: NSObject, MainScreenRoutingLogic, MainScreenDataPassing
{
    weak var viewController: MainScreenViewController?
    var dataStore: MainScreenDataStore?
    
    // MARK: Passing data
    func passDataToCharacterDetail()
    {
        if let selectedIndexPath = viewController?.table.indexPathForSelectedRow {
            if let selectedCharacter = dataStore?.characters![selectedIndexPath.row] {
                let detailViewController: DetailScreenViewController = UIStoryboard(storyboard: .Main).instantiateViewController()
                detailViewController.selectedCharacter = selectedCharacter
                viewController?.navigationController?.pushViewController(detailViewController, animated: true)
            }
        }
    }
}
