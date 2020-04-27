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
               Button(action: {}, label: {Text("New Group")})
           })
    
    }
}
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
