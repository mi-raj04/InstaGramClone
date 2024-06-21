//
//  HomeScreenCommentView.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 18/04/24.
//

import SwiftUI

struct HomeScreenCommentView: View {
    @State var commentshow = false
    var commentCount = 3
    var body: some View {
        VStack() {
            HStack {
                HStack(alignment:.top,spacing: 15) {
                    Image(.story)
                        .resizable()
                        .frame(width: 50,height: 50)
                        .cornerRadius(25.0)
                    VStack(alignment:.leading,spacing:2) {
                        HStack {
                            Text("Dhruv Rathi")
                                .font(.system(size: 15))
                            Text("11:25")
                                .font(.system(size: 15))
                                .fontWeight(.light)
                        }
                        Text("this is awesome picutre ")
                            .font(.system(size: 16))
                        HStack(spacing:10) {
                            Text("Reply")
                                .font(.system(size: 15))
                                .fontWeight(.medium)
                                .foregroundStyle(.gray)
                                .opacity(0.8)
                            Text("see Translations")
                                .font(.system(size: 15))
                                .fontWeight(.medium)
                                .foregroundStyle(.gray)
                                .opacity(0.8)
                        }
                    }
                    Spacer()
                }
                VStack() {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .foregroundColor(.red)
                        .frame(width: 20,height: 20)
                    Text("4")
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                        .opacity(0.8)
                }
            }
            if commentCount > 0 {
                VStack() {
                    Button {
                        withAnimation {
                            commentshow.toggle()
                        }
                    }label: {
                            HStack(spacing:0) {
                                Text("-")
                                    .frame(width: 25)
                                    .foregroundStyle(.gray)

                                Text("view 42 more replies")
                                    .font(.system(size: 15))
                                    .fontWeight(.medium)
                                    .foregroundStyle(.gray)
                                .opacity(0.8)
                                Spacer()
                            }
                }
                    if (commentshow) {
                        VStack(spacing:8) {
                            ForEach(0..<commentCount) { _ in
                                HStack() {
                                    HStack(alignment:.top,spacing: 15) {
                                        Image(.story)
                                            .resizable()
                                            .frame(width: 34,height: 34)
                                            .cornerRadius(17)
                                        VStack(alignment:.leading,spacing:2) {
                                            HStack {
                                                Text("Dhruv Rathi")
                                                    .font(.system(size: 15))
                                                    .foregroundStyle(.black)
                                                Text("11:25")
                                                    .font(.system(size: 15))
                                                    .fontWeight(.light)
                                                    .foregroundStyle(.black)
                                            }
                                            Text("this is awesome picutre ")
                                                .font(.system(size: 16))
                                                .foregroundStyle(.black)
                                            HStack(spacing:10) {
                                                Text("Reply")
                                                    .font(.system(size: 15))
                                                    .fontWeight(.medium)
                                                    .foregroundStyle(.gray)
                                                    .opacity(0.8)
                                                Text("see Translations")
                                                    .font(.system(size: 15))
                                                    .fontWeight(.medium)
                                                    .foregroundStyle(.gray)
                                                    .opacity(0.8)
                                            }
                                        }
                                        Spacer()
                                    }
                                    VStack() {
                                        Image(systemName: "heart.fill")
                                            .resizable()
                                            .foregroundStyle(.red)
                                            .frame(width: 20,height: 20)
                                        Text("4")
                                            .font(.system(size: 15))
                                            .fontWeight(.medium)
                                            .foregroundStyle(.gray)
                                            .opacity(0.8)
                                    }
                                }
                            }
                        }
                    }
                }.padding(.leading,60)
            }
        }.padding()
    }
}

#Preview {
    HomeScreenCommentView()
}
