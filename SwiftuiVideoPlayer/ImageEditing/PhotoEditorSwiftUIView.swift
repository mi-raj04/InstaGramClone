//
//  PhotoEditorSwiftUIView.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 25/04/24.
//

import SwiftUI

struct PhotoEditorConfigure: View {
    @State var showData = false
    @State var image:Image?
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color.clear
            StoryEditView(dismissAction: { image in
                self.image = image
                showData.toggle()
            },postImage: Image(uiImage: UIImage(resource: .storyImage3)))
            
            if showData {
                ZStack(alignment:.bottom) {
                    image?
                        .resizable()
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
        .navigationBarHidden(true)
    }
}
