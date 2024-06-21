//
//  SharableCellView.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 19/04/24.
//

import SwiftUI

struct SharableCellView: View {
    @EnvironmentObject var userModle: UserViewModel
    @State var arrUser : [User] = []
    @State var searchText: String
    let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150)),
        GridItem(.adaptive(minimum: 150)),
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading)
                
                TextField("Search", text: $searchText)
                    .foregroundColor(.black)
                
                if !searchText.isEmpty {
                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
            .frame(height: 40)
            .background(Color(.systemGray5))
            .cornerRadius(20)
            .padding(.horizontal)
            .padding(.top,30)
            
            ScrollView(showsIndicators:false){
                LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                    ForEach(arrUser, id: \.id) { item in
                        VStack {
                            ZStack(alignment:.bottomTrailing) {
                                VStack {
                                    Circle()
                                        .strokeBorder(Color.gray,lineWidth: 1)
                                        .background(Circle().foregroundColor(Color.white))
                                        .frame(width: 100)
                                        .overlay {
                                            Image(.storyImage2)
                                                .resizable()
                                                .frame(width: 85,height: 85).cornerRadius(42.5)
                                        }
                                    Text(item.name)
                                        .font(.system(size: 15))
                                        .foregroundColor(.black)
                                    
                                }.frame(height: 110)
                                Button {
                                    item.isSelected.toggle()
                                } label: {
                                    Circle()
                                        .strokeBorder(Color.gray,lineWidth: 1)
                                        .background(Circle().foregroundColor(item.isSelected ? Color.blue : Color.white))
                                        .frame(width: 20)
                                        .padding(.top,30)
                                        .padding(.trailing,10)
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            .presentationCornerRadius(30)
            .presentationDetents([.medium,.large])
            
            Button {
            } label: {
                HStack {
                    Spacer()
                    Button {
                        
                    }label: {
                        Text("send")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(8)
                    }
                    Spacer()
                }
                .background(.gray.opacity(0.1))
                .frame(width:.infinity,height: 35)
                .cornerRadius(10)
                .padding()
            }
        }
        .onAppear{
            userModle.arrUser.append(User(name: "raj", isSelected: false))
            userModle.arrUser.append(User(name: "rahul", isSelected: false))
            userModle.arrUser.append(User(name: "samir", isSelected: false))
            userModle.arrUser.append(User(name: "sandip", isSelected: false))
            userModle.arrUser.append(User(name: "pratik", isSelected: false))
            arrUser = userModle.arrUser
        }
    }
}
