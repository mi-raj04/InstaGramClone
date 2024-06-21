//
//  User.swift
//  SwiftuiVideoPlayer
//
//  Created by mind on 19/04/24.
//

import SwiftUI

class User:Identifiable{
    var id = UUID()
    var name:String = ""
    var isSelected:Bool = false
    
    init(id: UUID = UUID(), name: String, isSelected: Bool) {
        self.id = id
        self.name = name
        self.isSelected = isSelected
    }
}

class UserViewModel: ObservableObject {
    @Published var arrUser: [User] = []
    
    
}
