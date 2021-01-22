//
//  StoriesProvider.swift
//  julia
//
//  Created by Vitaly Kozlov on 22.07.2020.
//  Copyright © 2020 Vitaly Kozlov. All rights reserved.
//

import Foundation

struct StoriesProvider {
    static func get() -> [Story] {
        return [
            Story(text: "First"),
            Story(text: "Second"),
            Story(text: "Third"),
            Story(text: "Fourth"),
        ]
    }
}
