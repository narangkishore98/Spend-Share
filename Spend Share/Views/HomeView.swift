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
    @State var ok = false
    var body: some View {
        NavigationView(){
           List
            {
                Text("Hello ")
                Text("Hello ")
                Text("Hello ")
            }.navigationBarTitle("Spend & Share").navigationBarItems(trailing: Button("+"){
            
           })
    
    }
}
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
