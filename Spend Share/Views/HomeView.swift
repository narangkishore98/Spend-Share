//
//  HomeView.swift
//  Spend Share
//
//  Created by Kishore Narang on 2020-04-25.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import SwiftUI
//@State var group =


struct HomeView: View {
    


    @State var addGroup = false
    
    
    init() {
     // To remove only extra separators below the list:
          UITableView.appearance().tableFooterView = UIView()

          // To remove all separators including the actual ones:
          UITableView.appearance().separatorStyle = .none
    }
    
    
    @State var ok = false
    var body: some View {
        NavigationView(){
           List
            {
                
           GroupView()
                
                    
                 
                 
                
                    
                    
           }.navigationBarTitle("Spend & Share").navigationBarItems(trailing: HStack {
               Button(action: {
            
               // print(DataStore.getContacts(),"Contacts")
                
                self.addGroup = true
                
               }, label: {Image(systemName: "plus.circle")})
           })
    
        }.sheet(isPresented: $addGroup)
        {
            AddGroupView()
        }
}
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
