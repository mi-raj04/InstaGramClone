//
//  PostingEditedImageView.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 25/04/24.
//

import SwiftUI

struct PostingEditedImageView: View {
    @Binding var image:Image
    var body: some View {
        NavigationStack {
            image
                .resizable()
            .aspectRatio(contentMode: .fill)
            .navigationTitle("Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Post") {
                    print("About tapped!")
                }
            }

        }
    }
}

#Preview {
    PostingEditedImageView(image: .constant(Image(.tag)))
}
