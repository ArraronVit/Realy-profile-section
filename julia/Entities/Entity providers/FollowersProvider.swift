//
//  FollowersProvider.swift
//  julia
//
//  Created by Vitaly Kozlov on 23.07.2020.
//  Copyright © 2020 Vitaly Kozlov. All rights reserved.
//

import Foundation

struct FollowersProvider {
    static func get() -> [Follower] {
        return [
            Follower(photo: #imageLiteral(resourceName: "Image-10"), nickName: "Aaron", fullName: "AaronFullllll"),
            Follower(photo: #imageLiteral(resourceName: "Image-10"), nickName: "Bbron", fullName: "BBronFulllllll"),
            Follower(photo: #imageLiteral(resourceName: "Image-10"), nickName: "CCron", fullName: "CCronFulllllll")
        ]
    }
}
