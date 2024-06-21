//
//  CustomSegmentController.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 26/04/24.
//

import SwiftUI

struct CustomSegmentedControl: View {
    @Binding var selectedIndex: Int
    let images: [String]
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 0) {
                HStack(spacing: 0) {
                    ForEach(0..<self.images.count) { index in
                        Button(action: {
                            withAnimation {
                                self.selectedIndex = index
                            }
                        }) {
                            Spacer()
                                .frame(maxWidth: .infinity)
                            Image(self.images[index])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding(10)
                                .foregroundColor(index == self.selectedIndex ? .blue : .gray)
                            Spacer()
                                .frame(maxWidth: .infinity)
                        }
                        .background(Color.white)
                    }
                }
                .background(Color.white)
                Rectangle()
                    .frame(width: geometry.size.width / CGFloat(self.images.count), height: 2)
                    .foregroundColor(.black)
                    .offset(x: CGFloat(self.selectedIndex) * (geometry.size.width / CGFloat(self.images.count)) - ((geometry.size.width / CGFloat(self.images.count)) / 2)) // Adjust offset to center below selected segment
            }
        }
    }
}
