//
//  RealityTableViewCell.swift
//  julia
//
//  Created by Vitaly Kozlov on 30.07.2020.
//  Copyright © 2020 Vitaly Kozlov. All rights reserved.
//

import UIKit

class RealityTableViewCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var realityDescription: UILabel!
    @IBOutlet weak var includeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        name.font = UIFont(name: "AvenirNext-Medium", size: 17)
        name.textColor = UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1)
        
        realityDescription.font = UIFont(name: "AvenirNext-Regular", size: 12)
        realityDescription.textColor = UIColor(red: 0.518, green: 0.518, blue: 0.518, alpha: 1)
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(photo: UIImage, realityName: String, description: String) {
        avatar.image = photo
        name.text = realityName
        realityDescription.text = description
    }
}
