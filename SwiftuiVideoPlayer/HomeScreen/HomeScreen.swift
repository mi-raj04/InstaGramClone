//
//  HomeScreen.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 16/04/24.
//

import SwiftUI

struct HomeScreen: View {
    @State var post:[Post]
    @State var pushPostView = false
    @State var pushVideoView = false
    @State var pushPostShowView = false

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                Button {
                                    pushPostView.toggle()
                                }label: {
                                    Image(systemName: "camera.circle")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                }
                                Button {
                                    pushVideoView.toggle()
                                }label: {
                                    Image(systemName: "video.circle")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                }
                                StoryView(stories: stories) {
                                    pushPostShowView = true
                                }
                            }
                                .scrollTargetLayout()
                        }
                        .scrollTargetBehavior(.viewAligned)
                        .safeAreaPadding(.horizontal, 20)
                        .frame(height: 76).clipped()
                       
                    ForEach($post, id: \.id) {(post) in
                        PostView(post: post,screenWidth: geometry.size.width, comment: "")
                        }
                }.onAppear {
                    post = [
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
                             Post(id: 11, userName: "Ilovemydog", text: "You’re such a cute pup and this post is beautiful 🐶", profileImageName: "storyImage2", imageName: ["http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"], type: "video",like: false,save: false, likeCount: 0)]
                }
                .listStyle(.plain)
                .navigationBarTitle(Text("Raj's Social Demo"), displayMode: .inline)
                        .navigationBarItems(leading: 
                                            Button(action: {
                            print("click camera...")
                        }, label: {
                            Image("Camera")
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }), trailing: Button(action: {
                            print("click send message...")
                        }, label: {
                            Image("Message")
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }))
                }
            .toolbar(pushPostView || pushVideoView || pushPostShowView ? .hidden : .visible, for: .tabBar)
            .fullScreenCover(isPresented: $pushPostView, content: {
                PhotoEditorConfigure()
            })
            
            .fullScreenCover(isPresented: $pushVideoView, content: {
                VideoPickerContentView()
            })
            
            .fullScreenCover(isPresented: $pushPostShowView, content: {
                ContentViewPost()
            })
        }
    }
}

#Preview {
    HomeScreen(post: [
        Post(id: 0, userName: "dogstagram", text: "Hanging out with cute dog in the park😍 \nDo you think I’m cute?🐶 Thumbs up if you think I am cute!💞", profileImageName: "storyImage5", imageName: ["storyImage"], type: "img",like: false,save: false, likeCount: 0),
             Post(id: 1, userName: "lovely_pubby", text: "Sunday mooood 🌙", profileImageName: "storyImage4", imageName: ["storyImage1","storyImage4","storyImage2"], type: "img",like: false,save: false, likeCount: 0),
             Post(id: 2, userName: "Ilovemydog", text: "You’re such a cute pup and this post is beautiful 🐶", profileImageName: "storyImage2", imageName: ["storyImage2"], type: "img",like: false,save: false, likeCount: 0),
             Post(id: 3, userName: "Ilovemydog", text: "You’re such a cute pup and this post is beautiful 🐶", profileImageName: "storyImage2", imageName: ["http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"], type: "video",like: false,save: false, likeCount: 0),
             Post(id: 4, userName: "dogstagram", text: "Hanging out with cute dog in the park😍 \nDo you think I’m cute?🐶 Thumbs up if you think I am cute!💞", profileImageName: "storyImage5", imageName: ["storyImage"], type: "img",like: false,save: false, likeCount: 0)
    ])
}
