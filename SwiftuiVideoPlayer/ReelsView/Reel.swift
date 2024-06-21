//
//  Reel.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 16/04/24.
//

import Foundation
import AVKit

struct Reel: Identifiable{
    var id = UUID().uuidString
    var player: AVPlayer?
    var mediaFile: MediaFile
    var isLike:Bool
    var isFollow:Bool
    var labelExpand:Bool

}
struct MediaFile: Identifiable {
    var id = UUID().uuidString
    var url: String
    var title: String
    var isExpanded: Bool = false
}
var MediaFileJSON = [
    MediaFile(url: "https://videos.pexels.com/video-files/20532935/20532935-sd_640_360_24fps.mp4", title: "Apple Airtag....."),
    MediaFile(url: "https://videos.pexels.com/video-files/20378580/20378580-sd_640_360_30fps.mp4", title: "Animal Corssing"),
    MediaFile(url: "https://videos.pexels.com/video-files/19215250/19215250-sd_640_360_24fps.mp4", title: "Sponsorship"),
    MediaFile(url: "https://videos.pexels.com/video-files/18084154/18084154-sd_640_360_25fps.mp4", title: "Apple Airtag....."),
    MediaFile(url: "https://videos.pexels.com/video-files/19948267/19948267-sd_540_960_25fps.mp4", title: "Animal Corssing"),
    
    MediaFile(url: "https://videos.pexels.com/video-files/15921892/15921892-sd_640_360_25fps.mp4", title: "Apple Airtag....."),
    MediaFile(url: "https://videos.pexels.com/video-files/6950555/6950555-sd_640_360_25fps.mp4", title: "Animal Corssing"),
    MediaFile(url: "https://videos.pexels.com/video-files/20496059/20496059-sd_540_960_30fps.mp4", title: "Sponsorship"),
    MediaFile(url: "https://videos.pexels.com/video-files/11400682/11400682-sd_540_882_30fps.mp4", title: "Apple Airtag....."),
    MediaFile(url: "https://videos.pexels.com/video-files/20246932/20246932-sd_540_960_25fps.mp4", title: "Animal Corssing"),

    MediaFile(url: "https://videos.pexels.com/video-files/20496059/20496059-sd_540_960_30fps.mp4", title: "Apple Airtag....."),
    MediaFile(url: "https://videos.pexels.com/video-files/20233414/20233414-sd_640_338_30fps.mp4", title: "Animal Corssing"),
    MediaFile(url: "https://videos.pexels.com/video-files/20468575/20468575-sd_540_960_30fps.mp4", title: "Sponsorship"),
    MediaFile(url: "https://videos.pexels.com/video-files/20486952/20486952-sd_540_960_30fps.mp4", title: "Apple Airtag....."),
    MediaFile(url: "https://videos.pexels.com/video-files/7332918/7332918-sd_540_960_25fps.mp4", title: "Animal Corssing"),

    MediaFile(url: "https://videos.pexels.com/video-files/20053504/20053504-sd_640_360_25fps.mp4", title: "Apple Airtag....."),
    MediaFile(url: "https://videos.pexels.com/video-files/20179799/20179799-sd_540_960_30fps.mp4", title: "Animal Corssing"),
    MediaFile(url: "https://videos.pexels.com/video-files/18422163/18422163-sd_540_960_30fps.mp4", title: "Sponsorship"),
    MediaFile(url: "https://videos.pexels.com/video-files/20220683/20220683-sd_540_960_25fps.mp4", title: "Apple Airtag....."),
    MediaFile(url: "https://videos.pexels.com/video-files/20230491/20230491-sd_540_960_30fps.mp4", title: "Animal Corssing"),

    
]
















