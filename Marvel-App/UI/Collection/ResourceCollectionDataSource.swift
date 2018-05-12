//
//  PeopleCollectionController.swift
//  NewsFeed
//
//  Created by Carles Grau Galvan on 17/04/2017.
//  Copyright © 2017 Carles Grau Galvan. All rights reserved.
//

import UIKit

let reuseIdentifier = "resourceCellID"
let cellNibName = "ResourceCollectionViewCell"

class ResourceCollectionDataSource: NSObject, UICollectionViewDataSource {
    
    var resourceData: [Item]!
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resourceData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let nibName = UINib(nibName: cellNibName, bundle:nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: reuseIdentifier)
        
        let cell: ResourceCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ResourceCollectionViewCell
        cell.data = resourceData[indexPath.row]
        cell.backgroundView?.backgroundColor = UIColor.red
        return cell
    }
}
