//
//  ReelsPlayerView.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 26/04/24.
//

import SwiftUI

struct ReelsPlayer: View{
    
    @Binding var reel: Reel
    @Binding var currentReel: String
    
    @State var isMuted = false
    @State var volumeAnimation = false
    
    var body: some View{
        
        ZStack{
            
            if let player = reel.player{
                CustomVideoPlayer(player: player)
                GeometryReader{ proxy -> Color in
                    
                    let minY = proxy.frame(in:.global).minY
                    let size = proxy.size
                    
                    DispatchQueue.main.async {
                        if -minY < (size.height / 2) && minY < (size.height / 2)
                            && currentReel == reel.id{
                            
                            player.isMuted = isMuted
                            player.play()
                            
                        }else{
                            DispatchQueue.main.async {
                                
                                player = nil
                            }
                        }
                    }
                    return Color.clear
                }
                Image(systemName: isMuted ? "speaker.slash.fill" : "speaker.wave.2.fill")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(.secondary)
                    .clipShape(Circle())
                    .foregroundColor(.black)
                    .opacity(volumeAnimation ? 1 : 0)
            }
            
        }
        .onTapGesture {
            if volumeAnimation {
                return
            }
            isMuted.toggle()
            reel.player!.isMuted = isMuted
            withAnimation{volumeAnimation.toggle()}
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            
                withAnimation{volumeAnimation.toggle()}
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
        
    }
}
