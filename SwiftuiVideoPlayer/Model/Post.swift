//
//  Post.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 16/04/24.
//

import Foundation
import AVFoundation
import SwiftUI

struct Post:Hashable {
    var id: Int
    var userName, text, profileImageName:String
    var imageName:[String]
    var type:String
    var like:Bool
    var save:Bool
    var likeCount:Int
}

