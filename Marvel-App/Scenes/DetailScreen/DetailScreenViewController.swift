//
//  DetailScreenViewController.swift
//  Marvel-App
//
//  Created by Carles Grau Galvan on 12/05/2018.
//  Copyright (c) 2018 Carles Grau Galvan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Kingfisher

protocol DetailScreenDisplayLogic: class {
    func displayCharacter(viewModel: DetailScreen.SelectedCharacter.ViewModel)
    func setupComicCollection(viewModel: DetailScreen.CollectionSettings.ViewModel)
    func setupSerieCollection(viewModel: DetailScreen.CollectionSettings.ViewModel)
    func setupEventCollection(viewModel: DetailScreen.CollectionSettings.ViewModel)
}

class DetailScreenViewController: UITableViewController, DetailScreenDisplayLogic {
    var interactor: DetailScreenBusinessLogic?
    var router: (NSObjectProtocol & DetailScreenRoutingLogic & DetailScreenDataPassing)?
    var selectedCharacter: Character!

    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var heroeName: UILabel!
    @IBOutlet weak var heroeDescription: UILabel!

    @IBOutlet weak var comicCollection: UICollectionView!
    @IBOutlet weak var serieCollection: UICollectionView!
    @IBOutlet weak var eventCollection: UICollectionView!

    @IBOutlet var collectionOfViews: Array<UITableViewCell>?
    @IBOutlet weak var descriptionCell: UITableViewCell!

    var comicDataSource: ResourceCollectionDataSource?
    weak public var comicDelegate: ResourceCollectionDelegate?

    var serieDataSource: ResourceCollectionDataSource?
    weak public var serieDelegate: ResourceCollectionDelegate?

    var eventDataSource: ResourceCollectionDataSource?
    weak public var eventDelegate: ResourceCollectionDelegate?

    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = DetailScreenInteractor()
        let presenter = DetailScreenPresenter()
        let router = DetailScreenRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: Routing

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        setupCollections()
        interactor?.requestCharacterData(request: DetailScreen.SelectedCharacter.Request(char: selectedCharacter))
    }

    private func setupCollections() {
        interactor?.requestComicCollection(request: DetailScreen.CollectionSettings.Request(items: selectedCharacter.comics?.items))
        interactor?.requestSerieCollection(request: DetailScreen.CollectionSettings.Request(items: selectedCharacter.series?.items))
        interactor?.requestEventCollection(request: DetailScreen.CollectionSettings.Request(items: selectedCharacter.events?.items))
    }

    func setupNavigationBar() {
        self.navigationController?.view.backgroundColor = UIColor(red: 0.918, green: 0.133, blue: 0.180, alpha: 1.00)
    }

    func displayCharacter(viewModel: DetailScreen.SelectedCharacter.ViewModel) {
        self.title = viewModel.name
        self.topImage.kf.setImage(with: viewModel.thumbnailResource)
        self.heroeName.text = viewModel.name
        if viewModel.description == "" {
            self.heroeDescription.text = "No description"
            descriptionCell.layer.bounds.size = CGSize(width: descriptionCell.layer.bounds.width, height: 50)
        } else {
            self.heroeDescription.text = viewModel.description
        }
    }

    func setupComicCollection(viewModel: DetailScreen.CollectionSettings.ViewModel) {
        comicCollection.delegate = viewModel.delegate
        comicDataSource = viewModel.dataSource
        comicCollection.dataSource = comicDataSource
    }

    func setupSerieCollection(viewModel: DetailScreen.CollectionSettings.ViewModel) {
        serieDataSource = viewModel.dataSource
        serieCollection.dataSource = viewModel.dataSource
        serieCollection.delegate = viewModel.delegate
    }

    func setupEventCollection(viewModel: DetailScreen.CollectionSettings.ViewModel) {
        eventCollection.delegate = viewModel.delegate
        eventDataSource = viewModel.dataSource
        eventCollection.dataSource = eventDataSource
    }
}
