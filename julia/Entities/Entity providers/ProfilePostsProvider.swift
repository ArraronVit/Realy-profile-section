//
//  ProfilePostsProvider.swift
//  julia
//
//  Created by Vitaly Kozlov on 22.07.2020.
//  Copyright © 2020 Vitaly Kozlov. All rights reserved.
//

import Foundation

struct ProfilePostsProvider {
    static func get() -> [ProfilePost] {
        return [
            ProfilePost(photo: #imageLiteral(resourceName: "Image-9"), time: "1h"),
            ProfilePost(photo: #imageLiteral(resourceName: "Image"), time: "3h"),
            ProfilePost(photo: #imageLiteral(resourceName: "Image-2"), time: "6h")
        ]
    }
}
