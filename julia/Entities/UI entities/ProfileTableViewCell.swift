//
//  ProfileTableViewCell.swift
//  julia
//
//  Created by Vitaly Kozlov on 17.07.2020.
//  Copyright © 2020 Vitaly Kozlov. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var accountPhoto: UIImageView!
    @IBOutlet weak var accountName: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        accountName.font = UIFont(name: "SFProText-Regular", size: 11.5)
        timeLabel.font = UIFont(name: "AvenirNext-Medium", size: 14)
        timeLabel.textColor = UIColor(red: 0.518, green: 0.518, blue: 0.518, alpha: 1)
        accountName.textColor = .black
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(post: UIImage, time: String) {
        photo.image = post
        timeLabel.text = time
    }
}
