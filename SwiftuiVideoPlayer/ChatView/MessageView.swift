//
//  MessageView.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 11/04/24.
//

import SwiftUI

struct Comment {
    let username: String
    let text: String
}

struct CommentView: View {
    let comment: Comment
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(comment.username)
                .font(.headline)
            Text(comment.text)
                .font(.body)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

struct CommentsView: View {
    @State private var newCommentText = ""
    @State private var comments: [Comment]
    @State private var scrollToBottom = false
    
    init(comments: [Comment]) {
        self._comments = State(initialValue: comments)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Comments")
                .font(.title)
                .padding(.horizontal)
            Divider()
            ScrollViewReader { scrollView in
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(comments, id: \.text) { comment in
                            CommentView(comment: comment)
                                .id(comment.text)
                        }
                    }
                    .padding(.horizontal)
                    .onChange(of: scrollToBottom) { _ in
                        if scrollToBottom {
                            scrollView.scrollTo(comments.last?.text, anchor: .bottom)
                            scrollToBottom = false
                        }
                    }
                }
                .onAppear {
                    scrollToBottom = true
                }
                .padding(.bottom, 60)
            }
            HStack {
                TextField("Add a comment", text: $newCommentText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: addComment) {
                    Text("Post")
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
    
    func addComment() {
        if !newCommentText.isEmpty {
            let newComment = Comment(username: "Raj Saija", text: newCommentText)
            comments.append(newComment)
            newCommentText = ""
            scrollToBottom = true
        }
    }
}

struct MessageViewContent: View {
    let sampleComments = [
        Comment(username: "User1", text: "Great post!"),
        Comment(username: "User2", text: "Thanks for sharing."),
        Comment(username: "User3", text: "Interesting topic."),
        Comment(username: "User4", text: "I have a question."),
        Comment(username: "User5", text: "Nice explanation!")
    ]
    
    var body: some View {
        CommentsView(comments: sampleComments)
            .padding()
    }
}

struct MessageViewContent_Previews: PreviewProvider {
    static var previews: some View {
        MessageViewContent()
    }
}

