//
//  HeroesTableDataSource.swift
//  marvel-app
//
//  Created by Carles Grau Galvan on 13/05/2017.
//  Copyright © 2017 Carles Grau Galvan. All rights reserved.
//

import Foundation
import UIKit

class HeroesTableDataSource: NSObject, UITableViewDataSource{
    
    let reuseIdentifier = "HeroeTableCellID"
    let cellNibName = "HeroeTableCell"
    
    var data: Array<Character> = []
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nibName = UINib(nibName: cellNibName, bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: reuseIdentifier)
        
        let cell: HeroeTableCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! HeroeTableCell
        cell.heroeData = data[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
}
