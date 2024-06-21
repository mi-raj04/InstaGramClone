//
//  StoryEditView.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 25/04/24.
//

import SwiftUI
import PhotoEditorSDK

struct StoryEditView: View {
    var dismissAction: ((_ image:Image) -> Void)?
    @State var pickedImage:Photo?
    @State var bottomsheetpresent = true
    @State var movePostScreen = false
    @State var postImage:Image
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
//        NavigationStack{
            ZStack(alignment:.bottom) {
                Color.clear
                if let image = pickedImage {
                    PhotoEditor(photo: image)
                        .onDidSave { result in
                          print("Received image with \(result.output.data.count) bytes")
                            let base64EncodedString = result.output.data.base64EncodedString()
                            postImage = Image(uiImage: UIImage(data: Data(base64Encoded: base64EncodedString)!)!)
                            print(postImage)
                            movePostScreen = true
                            dismissAction!(postImage)
                        }
                        .onDidCancel {
                            dismissAction!(Image(.storyImage5))
                            dismiss()
                        }
                        .onDidFail { error in
                          print("Editor finished with error: \(error.localizedDescription)")
                            dismissAction!(Image(.storyImage5))
                        }
                }
            }
            .ignoresSafeArea(.all)
            .fullScreenCover(isPresented: $bottomsheetpresent) {
                ImagePicker(pickedImage: self.$pickedImage) {
                    self.bottomsheetpresent = false
                    dismiss()
                }
            }
            .navigationDestination(isPresented: $movePostScreen) {
                PostingEditedImageView(image: $postImage)
            }
        }
}

struct StoryEditView_Previews: PreviewProvider {
    static var previews: some View {
        StoryEditView(pickedImage: Photo(image: UIImage(imageLiteralResourceName: "storyImage2")), postImage: Image(uiImage: UIImage(imageLiteralResourceName: "storyImage2")))
    }
}
