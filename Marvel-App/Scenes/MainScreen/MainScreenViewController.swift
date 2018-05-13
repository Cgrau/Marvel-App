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

class MainScreenViewController: UIViewController, MainScreenDisplayLogic
{
    var interactor: MainScreenBusinessLogic?
    var router: (NSObjectProtocol & MainScreenRoutingLogic & MainScreenDataPassing)?
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var actInd: UIActivityIndicatorView!
    
    var tableDataSource: HeroesTableDataSource?
    var tableDelegate: HeroesTableDelegate?
    
    @IBOutlet weak var noResultsView: RoundBorderView!
    
    fileprivate lazy var dismissLayer: UIButton = {
        let button = UIButton(frame: UIScreen.main.bounds)
        button.addTarget(self, action: #selector(MainScreenViewController.dismissKeyboard), for: .touchUpInside)
        return button
    }()
    
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
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Marvel"
        configureTable()
        searchBar.delegate = self
    }
    
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
}

extension MainScreenViewController: UISearchBarDelegate {
    
    @objc private func dismissKeyboard() {
        searchBar.endEditing(true)
    }
    
    fileprivate func addDismissKeyboardLayer() {
        self.view.addSubview(dismissLayer)
        self.view.bringSubview(toFront: searchBar)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        noResultsView.hide()
        addDismissKeyboardLayer()
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.dismissLayer.removeFromSuperview()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        let request = MainScreen.FetchItems.Request(searchString: searchBar.text!.trimmingCharacters(in: .whitespaces))
        actInd.startAnimating()
        interactor?.search(request: request)
        dismissKeyboard()
    }
}

extension MainScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.passDataToCharacterDetail()
    }
}
