//
//  UIStoryboard+Extension.swift
//  marvel-app
//
//  Created by Carles Grau Galvan on 13/05/2017.
//  Copyright © 2017 Carles Grau Galvan. All rights reserved.
//

import Foundation
import UIKit

//usage: let viewController: <ControllerName> = UIStoryboard(storyboard: Storyboard.Main).instantiateViewController()
//Se instancia la clase directamente con 1 linea
//El viewController tiene que tener de ID el mismo nombre que la clase en el storyboard.

extension UIStoryboard {

    //Storyboard name
    enum Storyboard: String {
        case Main
    }

    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.rawValue, bundle: bundle)
    }

    func instantiateViewController<T: UIViewController>() -> T where T: StoryboardIdentifiable {
        let optionalViewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier)

        guard let viewController = optionalViewController as? T  else {
            fatalError("Couldn’t instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }

        return viewController
    }

}

extension UIViewController : StoryboardIdentifiable {}

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {

    static var storyboardIdentifier: String {
        return String(describing: self)
    }

}
