//
//  GroupView.swift
//  Spend Share
//
//  Created by Kishore Narang on 2020-04-26.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import SwiftUI

struct GroupView: View {
    var groupName:String = "Temporary"
    var memberCount:Int = 2
    var amount:Double  = 203.09
    var body: some View {
        
       
             VStack()
                 {
                       Text(groupName)
                         .font(.largeTitle)
                     .bold()
                         .foregroundColor(.white)
                    
                    HStack()
                        {
                       
                           Image(systemName: "person")
                            Text("\(memberCount)").padding(.trailing, 20)
                            
                             
                         Image(systemName: "dollarsign.circle")
                           Text("\(amount)")
                           
                            
                    }.foregroundColor(.white)
                     
                     
                 }
                 
                 
                 
                   .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: 250, idealHeight: 0, maxHeight: 250, alignment: .center)
                 .cornerRadius(30)
                     
                 .background(LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(40)
    
    
    
}
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}
