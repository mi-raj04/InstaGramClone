//
//  ReelPlayer.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 16/04/24.
//

import SwiftUI
import AVFoundation

struct ReelPlayerView: View {
    
    @State var currentReel = ""
    @State private var isBottomSheetOpen = false
    @State private var showMore: Bool = false

    @State var reels = MediaFileJSON.map{ item -> Reel in
        
        let url = item.url
        let player = AVPlayer(url: URL(string: url)!)
        return Reel(player: player, mediaFile: item,isLike: false,isFollow: false, labelExpand: false)
        
    }
    
    var body: some View {
        
        GeometryReader{ proxy in
            
            let size = proxy.size
            
            TabView(selection: $currentReel){
                
                ForEach($reels){ $reel in
                
                    ReelsPlayer(reel: $reel,currentReel: $currentReel)
                        .overlay {
                            HStack(spacing:0) {
                                VStack(alignment:.leading, spacing:0) {
                                    Spacer()
                                    HStack(alignment: .center,spacing: 0) {
                                        Button {
                                        }label: {
                                            Image(.user)
                                                .resizable()
                                                .frame(width: 35,height: 35)
                                                .padding(.trailing,8)
                                        }
                                        Text("Raj Saija")
                                            .font(.system(size: 20))
                                            .foregroundStyle(.white)
                                            .padding(.trailing,8)
                                        Button {
                                            withAnimation {
                                                reel.isFollow.toggle()
                                            }
                                        }label: {
                                            Text(reel.isFollow ? "Following" : "Follow")
                                                .font(.system(size: 15))
                                                .fontWeight(.bold)
                                                .foregroundStyle(reel.isFollow ? .black : .white)
                                                .padding(.vertical,6)
                                                .padding(.horizontal,12)
                                                .background(reel.isFollow ? .white : .clear)
                                                .cornerRadius(20)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .stroke(.white, lineWidth: 1)
                                                )
                                        }
                                    }
                                    Text("this is my first Video please Like it and share with your friends")
                                        .font(.system(size: 15))
                                        .foregroundStyle(.white)
                                        .lineLimit(reel.labelExpand ? nil : 1)
                                        .padding(.top,8)
                                        .onTapGesture {
                                            withAnimation {
                                                reel.labelExpand.toggle()
                                            }
                                        }
                                }
                                Spacer()
                              HStack {
                                    Spacer()
                                    VStack {
                                        Spacer()
                                        VStack {
                                            Button {
                                                withAnimation {
                                                    reel.isLike.toggle()
                                                }
                                            }label: {
                                                Image(reel.isLike ? .heartFill : .heart)
                                                    .resizable()
                                                    .frame(width: 35,height: 35)
                                            }
                                            Text("3.2k")
                                                .font(.system(size: 12))
                                                .foregroundStyle(.white)
                                        }
                                        VStack {
                                            Button {
                                                isBottomSheetOpen.toggle()
                                            }label: {
                                                Image(.comment)
                                                    .resizable()
                                                    .frame(width: 35,height: 35)
                                            }
                                            Text("112")
                                                .font(.system(size: 12))
                                                .foregroundStyle(.white)
                                        }
                                        VStack {
                                            Button {
                                                    guard let url = URL(string: reel.mediaFile.url) else {
                                                        return
                                                    }
                                                
                                                    let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
                                                    UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
                                                } label: {
                                                    Image(systemName: "square.and.arrow.up")
                                                        .resizable()
                                                        .foregroundColor(.white)
                                                        .frame(width: 35, height: 35)
                                                }
                                            Text("87.2k")
                                                .font(.system(size: 12))
                                                .foregroundStyle(.white)
                                                .padding(.bottom)
                                        }
                                    }
                                }
                                .frame(width:50)
                            }
                            .padding(.bottom, 40)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                        }
                    .frame(width: size.width)
                    .rotationEffect(.init(degrees: -90))
                    .ignoresSafeArea(.all, edges: .top)
                    .tag(reel.id)
                }
            }
            .onAppear{
                currentReel = reels.first?.id ?? ""
            }
            .rotationEffect(.init(degrees: 90))
            .frame(width: size.height)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(width: size.width)
        }
        .sheet(isPresented: $isBottomSheetOpen) {
            MessageViewContent()
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.white.ignoresSafeArea())
  
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ReelPlayerView()
    }
}




