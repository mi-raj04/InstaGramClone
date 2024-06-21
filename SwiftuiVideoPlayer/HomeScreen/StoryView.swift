//
//  StoryView.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 16/04/24.
//

import Foundation
import SwiftUI

struct StoryView: View {
    let stories: [Story]
    var gotoPostView:(() -> Void)?
    var body: some View {
        NavigationStack {
            LazyHStack {
                ForEach(stories, id: \.id) { (story) in
                    ZStack {
                        Circle()
                            .fill(Color.init(red: 193/255, green: 53/255, blue: 132/255))
                            .clipShape(Circle())
                            .frame(width: 64, height: 64)
                        Circle()
                            .fill(Color.white)
                            .clipShape(Circle())
                            .frame(width: 60, height: 60)
                        Image(story.imageName)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 56, height: 56)
                    }.onTapGesture {
                        gotoPostView!()
                    }
                }
            }
        }

    }
}

