//
//  HeroesTableDataSource.swift
//  marvel-app
//
//  Created by Carles Grau Galvan on 13/05/2017.
//  Copyright © 2017 Carles Grau Galvan. All rights reserved.
//

import Foundation
import UIKit

class HeroesTableDataSource: NSObject, UITableViewDataSource {

    let reuseIdentifier = "HeroTableCellID"
    let cellNibName = "HeroTableCell"

    var data: Array<Character> = []

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nibName = UINib(nibName: cellNibName, bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: reuseIdentifier)

        let cell: HeroTableCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! HeroTableCell
        cell.heroData = data[indexPath.row]

        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
