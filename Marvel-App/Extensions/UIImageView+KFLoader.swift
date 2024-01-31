//
//  UIImageView+Thumbnail.swift
//  Marvel-App
//
//  Created by Carles Grau Galvan on 12/05/2018.
//  Copyright © 2018 Carles Grau Galvan. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with resource: Resource, activateLoader: Bool) {
        activateLoader == true ? setupLoader() : ()
        self.kf.setImage(with: resource) { (_, _) in
            activateLoader == true ? self.kf.indicator?.stopAnimatingView() : ()
        }
    }

    private func setupLoader() {
        self.kf.indicatorType = .activity
        (self.kf.indicator?.view as? UIActivityIndicatorView)?.color = .white
        self.kf.indicator?.startAnimatingView()
    }
}
