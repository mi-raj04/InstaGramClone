//
//  SwiftuiVideoPlayerApp.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 09/04/24.
//

import SwiftUI
import PhotoEditorSDK
@main
struct SwiftuiVideoPlayerApp: App {
    @StateObject var arrUser: UserViewModel = UserViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            MainTabbedView()
                .environmentObject(arrUser)
////            PhotoEditorSwiftUIView(photo: .constant(Photo(image: UIImage(resource: .storyImage3))), postImage: Image(uiImage: UIImage(resource: .storyImage3)) )
////            StoryEditView(postImage: Image(uiImage: UIImage(resource: .storyImage3)))
//            TestApp()
//            PhotoEditorConfigure()
        }
    }
}


