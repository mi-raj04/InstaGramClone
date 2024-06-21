//
//  CustomVideoPlayer.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 16/04/24.
//

import SwiftUI
import AVKit
// Custom Video Player from UIKit
struct CustomVideoPlayer: UIViewControllerRepresentable {
    
    var player: AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        
        let controller = AVPlayerViewController()
        controller.player = player
        player.play()
        controller.showsPlaybackControls = false
        controller.videoGravity = .resizeAspectFill
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}
