//
//  AddGroupView.swift
//  Spend Share
//
//  Created by Kishore Narang on 2020-04-26.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import SwiftUI

struct AddGroupView: View {
    @State private var groupName = ""
    var body: some View {
        
        
        VStack()
            {
                Text("New Group")
                TextField("Enter Group Name", text: $groupName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
            
        }
        
    }
}

struct AddGroupView_Previews: PreviewProvider {
    static var previews: some View {
        AddGroupView()
    }
}
