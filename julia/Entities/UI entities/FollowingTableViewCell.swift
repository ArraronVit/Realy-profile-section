//
//  FollowingTableViewCell.swift
//  julia
//
//  Created by Vitaly Kozlov on 23.07.2020.
//  Copyright © 2020 Vitaly Kozlov. All rights reserved.
//

import UIKit

class FollowingTableViewCell: UITableViewCell {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var followButton: RoundedButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nickName.font = UIFont(name: "AvenirNext-Medium", size: 17)
        fullName.font = UIFont(name: "AvenirNext-Regular", size: 12)
        fullName.textColor = UIColor(red: 0.518, green: 0.518, blue: 0.518, alpha: 1)
        followButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 15)
        followButton.layer.borderColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1).cgColor
        followButton.setTitleColor(UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1), for: .normal)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(avatar: UIImage, nick: String, name: String) {
        photo.image = avatar
        nickName.text = nick
        fullName.text = name
    }
}
