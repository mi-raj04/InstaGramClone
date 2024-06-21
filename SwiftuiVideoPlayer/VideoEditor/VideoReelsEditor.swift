//
//  VideoReelsEditor.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 25/04/24.
//

import SwiftUI
import VideoEditorSDK
import UIKit
import _AVKit_SwiftUI


struct VideoPickerContentView: View {
    @State private var videoURL: URL?
    @State private var showPicker = true
    @Environment(\.dismiss) var dismiss
    @State var showData = false
    var dismissAction: (() -> Void)?

    var body: some View {
        VStack {
            if let url = videoURL {
                ZStack {
                    VideoEditor(video: Video(url: url))
                      .onDidSave { result in
                        print("Received video at \(result.output.url.absoluteString)")
                                dismissAction?()
                          showData.toggle()
                      }
                      .onDidCancel {
                                dismissAction?()
                          dismissAction?()
                          dismiss()
                      }
                      .onDidFail { error in
                        print("Editor finished with error: \(error.localizedDescription)")
                                dismissAction?()
                          dismissAction?()
                          dismiss()
                      }
                      .symbolRenderingMode(.hierarchical)
                    
                    if showData {
                        ZStack(alignment:.bottom) {
                            VideoPlayer(player: AVPlayer(url: videoURL!))
                                .aspectRatio(contentMode: .fill)
                            HStack {
                                Button("Save"){
                                    dismiss()
                                }.buttonStyle(.borderedProminent)
                                    .padding(.bottom)
                            }
                        }
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showPicker) {
            VideoPickerView(videoURL: self.$videoURL) {
                self.showPicker = false
                dismiss()
            }
        }
    }
}

struct VideoPickerContentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPickerContentView()
    }
}
