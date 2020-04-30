//
//  DemoView.swift
//  Spend Share
//
//  Created by Kishore Narang on 2020-04-30.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import SwiftUI


struct DemoView: View {
    
    @State var numbers = ["One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten"]
    @State var editMode = EditMode.inactive
    @State var selection = Set<String>()
    
    var body: some View {
        NavigationView(){
        List(selection: $selection) {
                   ForEach(numbers, id: \.self) { number in
                       Text(number)
                   }
               }
                // 2.
               .navigationBarItems(leading: deleteButton, trailing: editButton)
                // 3.
               .environment(\.editMode, self.$editMode)
        
        
        
    }
    }
    
    private var deleteButton: some View {
        if editMode == .inactive {
            return Button(action: {}) {
                Image(systemName: "")
            }
        } else {
            return Button(action: deleteNumbers) {
                Image(systemName: "trash")
            }
        }
    }
    
    private func deleteNumbers() {
        for id in selection {
            if let index = numbers.lastIndex(where: { $0 == id })  {
                numbers.remove(at: index)
            }
        }
        selection = Set<String>()
    }
    
    private var editButton: some View {
        if editMode == .inactive {
            return Button(action: {
                self.editMode = .active
                self.selection = Set<String>()
            }) {
                Text("Edit")
            }
        }
        else {
            return Button(action: {
                self.editMode = .inactive
                self.selection = Set<String>()
            }) {
                Text("Done")
            }
        }
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
