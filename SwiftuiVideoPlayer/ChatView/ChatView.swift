//
//  ChatView.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 16/04/24.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        NavigationView {
            VStack {
                    ScrollView(showsIndicators:false) {
                        VStack {
                            ForEach(0..<19){ _ in
                                HStack {
                                    VStack {
                                        Image(.storyImage1)
                                            .resizable()
                                            .frame(width: 50,height: 50)
                                        .cornerRadius(25)
                                        Spacer()
                                    }
                                    
                                    VStack(alignment:.leading) {
                                        Text("Raj Saija")
                                            .font(.system(size: 16))
                                            .fontWeight(.black)
                                        .foregroundStyle(.gray)
                                        Text("Hi, how are you? ")
                                            .font(.system(size: 16))
                                            .fontWeight(.medium)
                                        .foregroundStyle(.gray)
                                        Spacer()
                                    }
                                    Spacer()
                                    VStack {
                                        Text("12:00 Am")
                                            .font(.system(size: 12))
                                            .fontWeight(.medium)
                                    Spacer()
                                    }
                                }
                                .padding(.vertical,4)
                            }
                        }.padding(.horizontal,18)
                    }
                }
            .navigationTitle("Chat")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ChatView()
}
