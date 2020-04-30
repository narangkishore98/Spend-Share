//
//  AddGroupView.swift
//  Spend Share
//
//  Created by Kishore Narang on 2020-04-26.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import SwiftUI

import Contacts
struct AddGroupView: View {
    
   
    @State var groupName = ""
    @State var list = DataStore.getContacts()
    @State var editMode = EditMode.active
    @State var selection = Set<Contact>()
    @State var textToShow = "Choose one or more contacts to add."
    
    var body: some View {
        
        VStack(){
            
            HStack()
                {
                    Text("Group").font(.title).fontWeight(.bold)
                    Spacer()
                    Button(action:{
                        
                        print(self.selection)
                        print(self.groupName)
                        
                    }){
                        Text("Make Group")
                    }
                    
            }.padding()
            TextField("Group Name", text: $groupName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Divider()
            HStack()
                {

                    Text(textToShow).foregroundColor(.secondary)
                    Spacer()
            }
            .padding()
        List(selection:$selection)
        {
            ForEach(list, id: \.self , content: {
                contact in
                Button(action:{
                    
                    print("Click")
                    self.textToShow = "\(self.selection.count) Contact(s) selected."
                })
                {
                ContactRowView(contact: contact)
                }
            })
        }
        .environment(\.editMode, $editMode)
        }
        
    }
    
}

struct AddGroupView_Previews: PreviewProvider {
    static var previews: some View {
        AddGroupView()
    }
}
