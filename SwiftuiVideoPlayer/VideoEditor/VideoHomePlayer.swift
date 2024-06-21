//
//  VideoHomePlayer.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 22/04/24.
//

import SwiftUI
import AVFoundation
import _AVKit_SwiftUI

struct VideoHomePlayer: View {
    
    @State var player:AVPlayer?
    @State var stringUrl:String
    let screenWidth: CGFloat
    
    var body: some View {
        VideoPlayer(player: player)
            .onAppear() {
                player = AVPlayer(url: URL(string: stringUrl)!)
                player?.externalPlaybackVideoGravity = .resizeAspectFill
                player?.play()
            }
            .frame(width: screenWidth,height: 250)
            .onDisappear() {
                player?.pause()
                player = nil
            }
    }
}

#Preview {
    VideoHomePlayer(stringUrl: "", screenWidth: 450)
}
