//
//  StoriesCollectionViewCell.swift
//  julia
//
//  Created by Vitaly Kozlov on 17.07.2020.
//  Copyright © 2020 Vitaly Kozlov. All rights reserved.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var storyText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        storyText.backgroundColor  = .clear
        storyText.textColor = .white
        storyText.font = UIFont(name: "AvenirNext-Bold", size: 10)
    }
    
    func update(text: String) {
        storyText.text = text
    }
}
