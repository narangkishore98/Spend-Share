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
    @State private var groupName = ""
    @State var editMode = EditMode.active
    
    @State var selection = Set<Contact>()
    
    
    
    var body: some View {
        
        
        VStack()
            {
                HStack()
                    {

                        Text("New Group")
                            .font(.title)
                            .padding()
                           
                        Spacer()
                        
                        Button(action:{
                            
                        })
                        {
                            Text("Make Group").padding()
                        }
                    .padding()
                }
                .padding(.top)
                    
                TextField("Enter Group Name", text: $groupName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                Divider()
                HStack(){
                    Text("Select Multiple Contacts to add")
                    .foregroundColor(.secondary)
                    Spacer()
                }
                .padding()
                    
               
                
                List(selection: $selection) {
                    ForEach(list, id:\.self) { contact in
                        
                        ContactRowView(contact: contact)
                    }
                }
             
                Spacer()
                
                
                
            
        }
    }
    
    
    var list = DataStore.getContacts()
    
}

struct AddGroupView_Previews: PreviewProvider {
    static var previews: some View {
        AddGroupView()
    }
}
