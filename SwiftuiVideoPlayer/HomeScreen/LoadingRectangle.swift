//
//  LoadingRectangle.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 26/04/24.
//

import SwiftUI
import Combine

struct LoadingRectangle: View {
    @ObservedObject var storyTimer: StoryTimer = StoryTimer(items: 7, interval: 3.0)
    
    var progress: CGFloat
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.white.opacity(0.3))
                    .cornerRadius(5)
                    .onTapGesture {
                        self.storyTimer.advance(by: -1)
                    }
                Rectangle()
                    .frame(width: geometry.size.width * self.progress, height: nil, alignment: .leading)
                    .foregroundColor(Color.white.opacity(0.9))
                    .cornerRadius(5)
                    .onTapGesture {
                        self.storyTimer.advance(by: 1)
                        
                    }
            }
        }
    }
}
    
    #Preview {
        ContentViewPost()
    }
    
    
    struct ContentViewPost: View {
        @ObservedObject var storyTimer: StoryTimer = StoryTimer(items: 7, interval: 3.0)
        @Environment(\.dismiss) var dismiss
        var imageNames:[String] = ["image01","image02","image03","image04","image05","image06","image07"]
        
        init() {
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        }

        
        var body: some View {
            NavigationStack {
                GeometryReader { geometry in
                    VStack {
                        ZStack(alignment: .top) {
                            Image(self.imageNames[Int(self.storyTimer.progress)])
                                .resizable()
                                .edgesIgnoringSafeArea(.all)
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: nil, alignment: .center)
                                .animation(.none)
                                .onTapGesture { location in
                                    if (location.x < UIScreen.main.bounds.midX) {
                                        withAnimation {
                                            storyTimer.advance(by: -1)
                                        }
                                    } else {
                                        withAnimation {
                                            storyTimer.advance(by: +1)
                                        }
                                    }
                                }
                            HStack(alignment: .center, spacing: 4) {
                                ForEach(self.imageNames.indices) { x in
                                    LoadingRectangle(progress: min( max( (CGFloat(self.storyTimer.progress) - CGFloat(x)), 0.0) , 1.0))
                                        .frame(width: nil, height: 2, alignment: .leading)
                                        .animation(.linear)
                                }
                            }.padding()
                        } .onAppear { self.storyTimer.start() }
                            .onDisappear { self.storyTimer.cancellable?.cancel() }
                    }
                }
                .navigationBarTitle(Text("Raj's Social Demo"), displayMode: .inline)
                        .navigationBarItems(trailing:
                                            Button(action: {
                            dismiss()
                        }, label: {
                            Image(systemName:"xmark.circle")
                                .resizable()
                                .foregroundColor(.white)
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }))
            }
        }
    }
    
    class StoryTimer: ObservableObject {
        
        @Published var progress: Double
        private var interval: TimeInterval
        private var max: Int
        private let publisher: Timer.TimerPublisher
        var cancellable: Cancellable?
        
        func advance(by number: Int) {
            let newProgress = Swift.max((Int(self.progress) + number) % self.max , 0)
            self.progress = Double(newProgress)
        }
        
        init(items: Int, interval: TimeInterval) {
            self.max = items
            self.progress = 0
            self.interval = interval
            self.publisher = Timer.publish(every: 0.1, on: .main, in: .default)
        }
        
        func start() {
            self.cancellable = self.publisher.autoconnect().sink(receiveValue: {  _ in
                var newProgress = self.progress + (0.1 / self.interval)
                if Int(newProgress) >= self.max { newProgress = 0 }
                self.progress = newProgress
            })
        }
    }
