//
//  ProfileView.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 16/04/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedIndex = 0
    @State private var addFriends = false
    let images = ["grid", "person"]
    private var data  = ["storyImage2"]
    private var data1:[String] = ["storyImage3","storyImage2","storyImage1","storyImage3","storyImage3","storyImage2","storyImage1","storyImage3","storyImage3","storyImage2","storyImage1","storyImage3","storyImage3","storyImage2","storyImage1","storyImage3","storyImage3","storyImage2","storyImage1","storyImage3","storyImage3","storyImage2","storyImage1","storyImage3"]
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 100)),
    ]
    @State var isSuccess: Bool = true
    @State var pushContentView = false
    @State var pushProfileView = false
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment:.leading,spacing:0) {
                HStack(spacing:4) {
                    Button {
                    }label: {
                        HStack {
                            Image(.lock)
                                .resizable()
                                .frame(width: 20,height: 20)
                            Text("Raj Saija")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                            Image(.bottom)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15,height: 15)
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    }label: {
                        Image("@")
                            .resizable()
                            .frame(width: 25,height: 25)
                            .padding(.horizontal,8)
                    }
                    
                    Button {
                        
                    }label: {
                        Image(.plus)
                            .resizable()
                            .frame(width: 25,height: 25)
                            .padding(.horizontal,8)
                    }
                    
                    Button {
                        
                    }label: {
                        Image(.menu)
                            .resizable()
                            .frame(width: 25,height: 25)
                            .padding(.horizontal,8)
                    }
                    
                }.padding(.bottom,20)
                
                ScrollView(showsIndicators:false){
                    HStack {
                        HStack {
                            ZStack(alignment:.bottomTrailing) {
                                Circle()
                                    .strokeBorder(Color.gray,lineWidth: 1)
                                    .background(Circle().foregroundColor(Color.white))
                                    .frame(width: 100)
                                    .overlay {
                                        Image(.storyImage2)
                                            .resizable()
                                            .frame(width: 85,height: 85).cornerRadius(42.5)
                                    }
                                
                                Image(systemName:"plus.circle.fill")
                                    .resizable()
                                    .foregroundColor(.blue)
                                    .frame(width: 30,height: 30)
                                    .background(.white)
                                    .cornerRadius(15)
                                    .padding(.bottom,12)
                                    .padding(.trailing,-8)
                            }.frame(height: 110)
                        }
                        Spacer()
                        HStack(spacing:25) {
                            VStack {
                                Text("1")
                                Text("post")
                                    .font(.system(size: 15))
                            }
                            VStack {
                                Text("42")
                                Text("Followers")
                                    .font(.system(size: 15))
                            }.padding(.leading,10)
                            
                            VStack {
                                Text("43")
                                Text("Following")
                                    .font(.system(size: 15))
                            }
                        }
                    }.padding(.bottom,8)
                    HStack {
                        VStack(alignment:.leading) {
                            Text("Raj Saija")
                                .font(.system(size: 16))
                                .padding(.horizontal)
                            Text("hi , i am good developer ")
                                .font(.system(size: 12))
                                .fontWeight(.regular)
                                .padding(.horizontal)
                            Text("Raj Saija")
                                .font(.system(size: 12))
                                .fontWeight(.regular)
                                .padding(.horizontal)
                        }
                        Spacer()
                    }
                    VStack(spacing:0) {
                        HStack(spacing:10) {
                            HStack {
                                Spacer()
                                Button {
                                    pushProfileView.toggle()
                                    
                                } label: {
                                    Text("Edit Profile")
                                        .font(.system(size: 15))
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .padding(8)
                                }
                                Spacer()
                            }.background(.gray.opacity(0.1))
                                .frame(height: 35)
                                .cornerRadius(10)
                            HStack {
                                Spacer()
                                Button {
                                    pushContentView.toggle()
                                } label: {
                                    Text("Share Profile")
                                        .font(.system(size: 15))
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .padding(8)
                                }
                                Spacer()
                            }.background(.gray.opacity(0.1))
                                .frame(height: 35)
                                .cornerRadius(10)
                            HStack {
                                Spacer()
                                Button {
                                    addFriends.toggle()
                                }label: {
                                    Image(systemName: "person.badge.plus")
                                        .foregroundColor(.black)
                                        .padding()
                                }
                                Spacer()
                            }
                            .background(.gray.opacity(0.1))
                            .frame(width: 35,height: 35)
                            .cornerRadius(10)
                        }
                        if(addFriends) {
                            ScrollView(.horizontal,showsIndicators:false ) {
                                HStack(spacing:0) {
                                    ForEach(0..<8) { _ in
                                        VStack(spacing:0) {
                                            Spacer()
                                            Image("storyImage2")
                                                .resizable()
                                                .frame(width: 70, height: 70, alignment: .center)
                                                .cornerRadius(35)
                                                .padding()
                                            
                                            Text("Raj Saija")
                                                .font(.system(size: 16))
                                                .fontWeight(.medium)
                                                .padding(.bottom,2)
                                            
                                            Text("Hi, I Like Coding")
                                                .font(.system(size: 15))
                                                .fontWeight(.regular)
                                                .multilineTextAlignment(.center)
                                                .padding(.horizontal)
                                                .padding(.bottom)
                                            
                                            HStack {
                                                Spacer()
                                                Button {
                                                }label: {
                                                    Text("Follow")
                                                        .font(.system(size: 15))
                                                        .fontWeight(.medium)
                                                        .foregroundColor(.white)
                                                        .padding(8)
                                                }
                                                Spacer()
                                            }
                                            .background(Color.blue)
                                            .frame(width:100,height: 35)
                                            .cornerRadius(10)
                                            .padding()
                                            Spacer()
                                        }
                                        .frame(width: 210,height: 220)
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(15)
                                        .padding(.vertical, 20)
                                        .padding(.horizontal, 4)
                                    }
                                }
                            }.scrollTargetBehavior(.viewAligned)
                             .safeAreaPadding(.horizontal, 0)
                        }
                    }
                    VStack {
                        CustomSegmentedControl(selectedIndex: $selectedIndex, images: images)
                            .padding(.top, 0)
                    }.frame(height:50)
                    LazyVGrid(columns: adaptiveColumn, spacing: 10) {
                        ForEach(selectedIndex == 0 ? 0..<data.count : 0..<data1.count, id: \.self) { i in
                            Image(selectedIndex == 0 ? data[i] : data1[i])
                                .resizable()
                                .frame(height: 130, alignment: .center)
                                .cornerRadius(5)
                        }
                    }
                    
                    if(selectedIndex == 0) {
                        withAnimation {
                            VStack(alignment:.leading,spacing:0) {
                                Text("Complete Your Profile")
                                    .font(.system(size: 22))
                                    .fontWeight(.semibold)
                                    .padding(.bottom,8)
                                HStack {
                                    Text("3")
                                        .fontWeight(.bold)
                                    +
                                    Text(" of ")
                                        .font(.system(size: 16))
                                    +
                                    Text("4")
                                        .fontWeight(.bold)
                                    +
                                    Text(" is Completed")
                                        .font(.system(size: 16))
                                }
                                
                                ScrollView(.horizontal,showsIndicators:false ) {
                                    HStack(spacing:0) {
                                        ForEach(0..<8) { _ in
                                            VStack {
                                                Image(systemName: "phone.circle")
                                                    .resizable()
                                                    .frame(width: 50, height: 50, alignment: .center)
                                                    .padding()
                                                Text("Add a Bio")
                                                    .font(.system(size: 16))
                                                    .fontWeight(.medium)
                                                Text("you are awesome and i like it ")
                                                    .font(.system(size: 15))
                                                    .fontWeight(.regular)
                                                    .multilineTextAlignment(.center)
                                                    .padding(.horizontal)
                                                    .padding(.bottom)
                                                HStack {
                                                    Spacer()
                                                    Button {
                                                    }label: {
                                                        Text("Click Me")
                                                            .font(.system(size: 15))
                                                            .foregroundColor(.black)
                                                            .padding(8)
                                                    }
                                                    Spacer()
                                                }
                                                .background(.gray.opacity(0.1))
                                                .frame(width:100,height: 35)
                                                .cornerRadius(10)
                                                Spacer()
                                            }.frame(width: 210,height: 220)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .stroke(Color.gray.opacity(0.5), lineWidth: 0.5)
                                                )
                                                .padding(.vertical, 20)
                                                .padding(.horizontal, 08)
                                        }
                                    }
                                }.scrollTargetBehavior(.viewAligned)
                                    .safeAreaPadding(.horizontal, 0)
                            }.padding(.vertical,20)
                        }
                    }
                }
                .padding(0)
            }
            .padding()
            .navigationDestination(isPresented: $pushContentView) {
                ContentView()
            }
            .navigationDestination(isPresented: $pushProfileView) {
                EditProfileView()
            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(pushProfileView || pushContentView ? .hidden : .visible, for: .tabBar)
    }
}

#Preview {
    ProfileView()
}

