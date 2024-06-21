//
//  QRcodeView.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 22/04/24.
//

import SwiftUI

struct QRCodeView: View {
    let name: String
    @State var colorBackground = Color.pink
    let colors: [Color] = [.blue, .green, .orange, .yellow, .purple]
    
    func getRandomColor() -> Color {
        return colors.randomElement() ?? .black
    }
    var body: some View {
        ZStack {
            colorBackground
                .onTapGesture {
                    self.colorBackground = getRandomColor()
                }
            VStack {
                Image(uiImage: generateQRCode(from: name))
                    .interpolation(.none)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                
                Text("@Raj Saija")
                    .font(.system(size: 36))
                    .foregroundStyle(.black)
                
                HStack {
                    Button {
                        
                    }label: {
                        VStack {
                            Image(systemName: "square.and.arrow.up")
                                .resizable()
                                .foregroundColor(.gray.opacity(0.8))
                                .frame(width: 30,height: 35)
                            
                            Text("Share Profile")
                                .foregroundStyle(.gray)
                                .font(.system(size: 18))
                                .fontWeight(.regular)
                                .padding(4)
                        }
                        .frame(width: 150,height: 110)
                        .background(.white)
                        .cornerRadius(20)
                    }
                    
                    Button {
                        
                    }label: {
                        VStack {
                            Image(systemName: "link")
                                .resizable()
                                .foregroundColor(.gray.opacity(0.8))
                                .frame(width: 30,height: 35)
                            
                            Text("Share Link")
                                .foregroundStyle(.gray)
                                .font(.system(size: 18))
                                .fontWeight(.regular)
                                .padding(4)
                        }
                        .frame(width: 150,height: 110)
                        .background(.white)
                        .cornerRadius(20)
                    }
                }
            }
        }
    }
    
    func generateQRCode(from string: String) -> UIImage {
        let data = string.data(using: .ascii)
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            if let outputImage = filter.outputImage {
                let context = CIContext()
                if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                    return UIImage(cgImage: cgImage)
                }
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct ContentView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        ZStack(alignment:.topLeading) {
            QRCodeView(name: "raj.saija@mindinventory.com")
                .navigationBarBackButtonHidden()
            
            Button {
                dismiss()
            }label: {
                Image(systemName: "chevron.backward")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 15,height: 30)
                    .padding(.leading,30)
                    .padding(.top,80)
            }
            
        }.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

