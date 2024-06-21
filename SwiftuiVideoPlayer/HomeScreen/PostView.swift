//
//  PostView.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 16/04/24.
//

import Foundation
import SwiftUI
import AVFoundation
import _AVKit_SwiftUI

struct PostView: View {
    @Binding var post: Post
    let screenWidth: CGFloat
    @State var player:AVPlayer?
    @State var comment:String
    @State var bottomsheetAppear:Bool = false
    @State var sharebottomSheetAppear:Bool = false

    @EnvironmentObject var userModle: UserViewModel
    var data  = Array(1...20)
    var body: some View {
     LazyVStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Image(post.profileImageName)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                    .clipped()
                Text(post.userName).font(.headline)
                Spacer()
                Text("24 h")
                    .font(.system(size: 15))
                    .padding(.trailing,16)
            }.padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 0))
            if (post.type == "video"){
                VideoHomePlayer(stringUrl: post.imageName.first!, screenWidth: screenWidth)
                    .onAppear() {
                        print("appear")
                    }
                    .onDisappear() {
                        print("disappear")
                    }
            } else {
                TabView {
                    ForEach(post.imageName,id: \.self) { image in
                        Image(image)
                            .resizable()
                            .scaledToFill()
                    }
                }
                .frame(width: screenWidth, height: 250)
                .tabViewStyle(PageTabViewStyle())
            }
            HStack {
                Button {
                    withAnimation {
                        post.like.toggle()
                        if (post.like == true) {
                            post.likeCount += 1
                        } else {
                            post.likeCount -= 1
                        }
                    }
                }label: {
                    Image(systemName:post.like ? "heart.fill" : "heart").resizable().foregroundColor(.black)
                        .frame(width: 25,height: 25)
                    }
                    NavigationLink {
                        VStack(spacing:8) {
                            Text("Comment")
                                .font(.system(size: 16))
                                .fontWeight(.heavy)
                            ScrollView(showsIndicators:false) {
                               VStack(spacing:0) {
                                    ForEach(0..<8) { _ in
                                        HomeScreenCommentView()
                                    }
                                }
                            }
                            
                            HStack {
                                TextField("type your comment here...", text: $comment)
                                    .textFieldStyle(.roundedBorder)
                                Button {
                                    comment = ""
                                }label: {
                                    Text("send")
                                        .padding()
                                        .frame(height: 35)
                                        .border(Color.blue, width: 0.5)
                                }
                            }.padding()
                        }

                    }label: {
                        Image(systemName: "message").resizable().foregroundColor(.black)
                            .frame(width: 25,height: 25)
                    }

                Button {
                    sharebottomSheetAppear
                        .toggle()
                } label: {
                    Image(.message).resizable().foregroundColor(.black)
                        .frame(width: 25,height: 25)
                }
                Spacer()
                Button {
                    withAnimation {
                        post.save.toggle()
                    }
                }label: {
                    Image(post.save ? .tagFill :  .tag).resizable().foregroundColor(.black)
                        .frame(width: 25,height: 25)
                }
            }.padding(.leading, 16).padding(.trailing, 16)
            Text("\(post.likeCount) likes")
                .font(.system(size: 15))
                .opacity(0.7)
                .padding(.leading, 16).padding(.trailing, 16)
            Text(post.text)
                .lineLimit(nil)
                .font(.system(size: 15))
                .padding(.leading, 16).padding(.trailing, 16)
            HStack(spacing: 8) {
                Image(post.profileImageName)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 20, height: 20)
                    .clipped()
                Text("View All Comment 172")
                    .font(.system(size: 15))
                    .opacity(0.7)
            }.onTapGesture {
                bottomsheetAppear.toggle()
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 16, trailing: 0))
        }.listRowInsets(EdgeInsets())
            .sheet(isPresented: $bottomsheetAppear, content: {
                VStack(spacing:8) {
                    Text("Comment")
                        .font(.system(size: 16))
                        .fontWeight(.heavy)
                    ScrollView(showsIndicators:false) {
                       VStack(spacing:0) {
                            ForEach(0..<8) { _ in
                                HomeScreenCommentView()
                            }
                        }
                    }
                    
                    HStack {
                        TextField("type your comment here...", text: $comment)
                            .textFieldStyle(.roundedBorder)
                        Button {
                            comment = ""
                        }label: {
                            Text("send")
                                .padding()
                                .frame(height: 35)
                                .border(Color.blue, width: 0.5)
                        }
                    }.padding()
                }
                .presentationCornerRadius(30)
                .presentationDetents([.medium,.large])
                .padding(.top,40)
            })
            .sheet(isPresented: $sharebottomSheetAppear, content: {
                SharableCellView(searchText: "")
                .onAppear{
                }
            })
    }
}

#Preview {
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
             Post(id: 11, userName: "Ilovemydog", text: "You’re such a cute pup and this post is beautiful 🐶", profileImageName: "storyImage2", imageName: ["http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"], type: "video",like: false,save: false, likeCount: 0)
    ])
}





