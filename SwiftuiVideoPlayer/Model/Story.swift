//
//  Story.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 16/04/24.
//

import Foundation
struct Story:Equatable {
    let id: Int
    let imageName: String
}

 let stories: [Story] = [
    Story(id: 0, imageName: "storyImage"),
    Story(id: 1, imageName: "storyImage1"),
    Story(id: 2, imageName: "storyImage2"),
    Story(id: 3, imageName: "storyImage3"),
    Story(id: 4, imageName: "storyImage4"),
    Story(id: 5, imageName: "storyImage5")
]
