//
//  MainTabView.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 16/04/24.
//

import Foundation
import SwiftUI

struct MainTabbedView: View {
    
    @State var selectedTab = 0
    @EnvironmentObject var userModle: UserViewModel
    
    var body: some View {
        
        NavigationView {
            TabView {
                HomeScreen(post: [
                    Post(id: 0, userName: "dogstagram", text: "Hanging out with cute dog in the park😍 \nDo you think I’m cute?🐶 Thumbs up if you think I am cute!💞", profileImageName: "storyImage5", imageName: ["storyImage"], type: "img",like: false,save: false, likeCount: 0),
                         Post(id: 1, userName: "lovely_pubby", text: "Sunday mooood 🌙", profileImageName: "storyImage4", imageName: ["storyImage1","storyImage4","storyImage2"], type: "img",like: false,save: false, likeCount: 0),
                         Post(id: 2, userName: "Ilovemydog", text: "You’re such a cute pup and this post is beautiful 🐶", profileImageName: "storyImage2", imageName: ["storyImage2"], type: "img",like: false,save: false, likeCount: 0),
                         Post(id: 3, userName: "Ilovemydog", text: "You’re such a cute pup and this post is beautiful 🐶", profileImageName: "storyImage2", imageName: ["http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"], type: "video",like: false,save: false, likeCount: 0),
                         Post(id: 4, userName: "dogstagram", text: "Hanging out with cute dog in the park😍 \nDo you think I’m cute?🐶 Thumbs up if you think I am cute!💞", profileImageName: "storyImage5", imageName: ["storyImage"], type: "img",like: false,save: false, likeCount: 0),
                         Post(id: 5, userName: "lovely_pubby", text: "Sunday mooood 🌙", profileImageName: "storyImage4", imageName: ["storyImage1"], type: "img",like: false,save: false, likeCount: 0),
                         Post(id: 6, userName: "Ilovemydog", text: "You’re such a cute pup and this post is beautiful 🐶", profileImageName: "storyImage2", imageName: ["storyImage2"], type: "img",like: false,save: false, likeCount: 0),
                         Post(id: 7, userName: "Ilovemydog", text: "You’re such a cute pup and this post is beautiful 🐶", profileImageName: "storyImage2", imageName: ["http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"], type: "video",like: false,save: false, likeCount: 0),
                         Post(id: 8, userName: "dogstagram", text: "Hanging out with cute dog in the park😍 \nDo you think I’m cute?🐶 Thumbs up if you think I am cute!💞", profileImageName: "storyImage5", imageName: ["storyImage"], type: "img",like: false,save: false, likeCount: 0),
                         Post(id: 9, userName: "lovely_pubby", text: "Sunday mooood 🌙", profileImageName: "storyImage4", imageName: ["storyImage1"], type: "img",like: false,save: false, likeCount: 0),
                         Post(id: 10, userName: "Ilovemydog", text: "You’re such a cute pup and this post is beautiful 🐶", profileImageName: "storyImage2", imageName: ["storyImage2"], type: "img",like: false,save: false, likeCount: 0),
                    Post(id: 11, userName: "Ilovemydog", text: "You’re such a cute pup and this post is beautiful 🐶", profileImageName: "storyImage2", imageName: ["http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"], type: "video",like: false,save: false, likeCount: 0)])
                .environmentObject(userModle)
                .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                ReelPlayerView()
                    .tabItem {
                        Label("Reels", systemImage: "video")
                    }
                
                ChatView()
                    .tabItem {
                        Label("Messages", systemImage: "message")
                    }
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
            }
            .navigationBarHidden(true)


        }
    }
}

