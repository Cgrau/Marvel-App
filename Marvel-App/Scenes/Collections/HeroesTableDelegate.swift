//
//  HeroesTableDelegate.swift
//  marvel-app
//
//  Created by Carles Grau Galvan on 13/05/2017.
//  Copyright © 2017 Carles Grau Galvan. All rights reserved.
//

import Foundation
import UIKit

class HeroesTableDelegate: NSObject, UITableViewDelegate {

    private var selectedCallback: ((IndexPath) -> Void)?

    func selectedItemAtIndex(callback:@escaping (IndexPath) -> Void) {
        selectedCallback = callback
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let callback = selectedCallback {
            callback(indexPath)
        }
    }
}
