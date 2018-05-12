//
//  MainScreenViewController.swift
//  Marvel-App
//
//  Created by Carles Grau Galvan on 11/05/2018.
//  Copyright © 2018 Carles Grau Galvan. All rights reserved.
//

import UIKit

protocol MainScreenDisplayLogic: class
{
    func displayFetchedItems(viewModel: MainScreen.FetchItems.ViewModel)
}

class MainScreenViewController: UIViewController, MainScreenDisplayLogic, UITableViewDelegate, UISearchBarDelegate
{
    var interactor: MainScreenBusinessLogic?
    var router: (NSObjectProtocol & MainScreenRoutingLogic & MainScreenDataPassing)?
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var actInd: UIActivityIndicatorView!
    
    var tableDataSource: HeroesTableDataSource?
    var tableDelegate: HeroesTableDelegate?
    
    @IBOutlet weak var noResultsView: RoundBorderView!
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = MainScreenInteractor()
        let presenter = MainScreenPresenter()
        let router = MainScreenRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Marvel"
        configureTable()
        searchBar.delegate = self
    }
    //@IBOutlet weak var nameTextField: UITextField!
    
    func displayFetchedItems(viewModel: MainScreen.FetchItems.ViewModel){
        tableDataSource?.data = viewModel.displayedItems
        if viewModel.displayedItems.count == 0 {
            noResultsView.show()
        }else{
            noResultsView.hide()
        }
        actInd.stopAnimating()
        table.reloadData()
    }
    
    func configureTable(){
        tableDataSource = HeroesTableDataSource()
        table.dataSource = tableDataSource
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        noResultsView.hide()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        let request = MainScreen.FetchItems.Request(searchString: searchBar.text!.trimmingCharacters(in: .whitespaces))
        actInd.startAnimating()
        interactor?.search(request: request)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.passDataToCharacterDetail()
    }
}
