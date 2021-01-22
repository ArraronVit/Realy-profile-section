//
//  SendToProvider.swift
//  julia
//
//  Created by Vitaly Kozlov on 30.07.2020.
//  Copyright © 2020 Vitaly Kozlov. All rights reserved.
//

import Foundation

struct SendToProvider {
    static func get() -> [SendTo] {
        return [
            SendTo(photo: #imageLiteral(resourceName: "Image-15"), name: "Profile", description: "Stays in your profile"),
            SendTo(photo: #imageLiteral(resourceName: "Image-15"), name: "AnotherProfile", description: "Stays in another profile")
        ]
    }
    
}
