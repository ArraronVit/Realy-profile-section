//
//  RecomendationCollectionViewCell.swift
//  julia
//
//  Created by Vitaly Kozlov on 24.07.2020.
//  Copyright © 2020 Vitaly Kozlov. All rights reserved.
//

import UIKit

class RecomendationCollectionViewCell: UICollectionViewCell {
  
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var nickName: UILabel!
    
    @IBOutlet weak var fullName: UILabel!
    
    @IBOutlet weak var followButton: RoundedButton!
    
    @IBAction func followButtonTapped(_ sender: Any) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nickName.font = UIFont(name: "AvenirNext-Medium", size: 13)
        nickName.textColor = UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1)
        fullName.font = UIFont(name: "AvenirNext-Regular", size: 12)
        fullName.textColor = UIColor(red: 0.478, green: 0.525, blue: 0.604, alpha: 1)
        followButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 15)
        followButton.layer.borderColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1).cgColor
        followButton.setTitleColor(.white, for: .normal)
        followButton.backgroundColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
    }
    
    func update(avatar: UIImage, nick: String, name: String) {
        photo.image = avatar
        nickName.text = nick
        fullName.text = name
    }
}
