//
//  EditProfileView.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 22/04/24.
//

import SwiftUI

struct EditProfileView: View {
    @State private var username = "Raj Saija"
    @State private var bio = "i am raj j saija"
    @State private var gender = "Male"
    @State private var birthdate = Date(timeIntervalSinceReferenceDate: -120586400)
    @State private var email = "raj.saija@mindinventory.com"
    @State private var phoneNumber = "+917778075741"
    
    var body: some View {
        Form {
            Section(header: Text("Profile Photo")) {
                VStack {
                    HStack {
                        Spacer()
                        Image(.storyImage2)
                            .resizable()
                            .frame(width: 100,height: 100)
                        .cornerRadius(50)
                        Spacer()
                    }
                    Text("Raj Saija")
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                }
            }
            
            Section(header: Text("Basic Information")) {
                TextField("Username", text: $username)
                TextField("Bio", text: $bio)
                Picker("Gender", selection: $gender) {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                    Text("Other").tag("Other")
                }
                DatePicker("Birthdate", selection: $birthdate, displayedComponents: .date)
            }
            
            Section(header: Text("Contact Information")) {
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                TextField("Phone Number", text: $phoneNumber)
                    .keyboardType(.phonePad)
            }
            
            Section {
                Button(action: {
                    
                }) {
                    Text("Save Changes")
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
            }
        }
        .navigationBarTitle("Edit Profile")
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
