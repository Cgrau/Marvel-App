//
//  RoundView.swift
//  marvel-app
//
//  Created by Carles Grau Galvan on 14/05/2017.
//  Copyright © 2017 Carles Grau Galvan. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class RoundBorderView: UIView {
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            setUpBorderColor()
        }
    }
    @IBInspectable var cornerRadiusValue: CGFloat = 10.0 {
        didSet {
            setUpView()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
        setUpBorderColor()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpView()
        setUpBorderColor()
    }
    func setUpView() {
        self.layer.cornerRadius = self.cornerRadiusValue
        self.clipsToBounds = true
    }

    func setUpBorderColor() {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = self.borderColor.cgColor
    }

    func hide() {
        UIView.animate(withDuration: 1) {
            self.isHidden = true
        }
    }
    func show() {
        UIView.animate(withDuration: 1) {
            self.isHidden = false
        }
    }
}
