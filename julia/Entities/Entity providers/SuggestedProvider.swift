//
//  SuggestedProvider.swift
//  julia
//
//  Created by Vitaly Kozlov on 30.07.2020.
//  Copyright © 2020 Vitaly Kozlov. All rights reserved.
//

import Foundation

struct SuggestedProvider {
    static func get() -> [Suggested] {
        return [
            Suggested(photo: #imageLiteral(resourceName: "Image-17"), name: "Dev AR Chat", description: "Hi nice AR"),
            Suggested(photo: #imageLiteral(resourceName: "Image-15"), name: "Another chat", description: "smth with Ar"),
            Suggested(photo: #imageLiteral(resourceName: "Image-10"), name: "Denis", description: "Full Denis")
        ]
    }
}
