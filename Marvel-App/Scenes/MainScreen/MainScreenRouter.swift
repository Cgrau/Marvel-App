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
    
    // MARK: Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: MainScreenViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
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
