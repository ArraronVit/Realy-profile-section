//
//  RoundedLabel.swift
//  julia
//
//  Created by Vitaly Kozlov on 13.07.2020.
//  Copyright © 2020 Vitaly Kozlov. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedLabel: UILabel {

   @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
        self.layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }

}
