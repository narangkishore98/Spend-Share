//
//  SignUpView.swift
//  Spend Share
//
//  Created by Kishore Narang on 2020-04-25.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var fullname = ""
    @State private var mobileNumber = ""
    var body: some View {
        VStack(){
            Text("Spend & Share")
                .font(.largeTitle)
            Text("Sign Up")
            Divider().padding()
            TextField("Full Name", text: $fullname).textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Mobile Number", text: $mobileNumber).textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {})
            {
                Text("Sign Up")
            }
        .padding(5)
            .foregroundColor(Color.white)
            .frame(minWidth: 0,  maxWidth:.infinity )
        
               .background(Color.blue)
            .cornerRadius(7)
        }
        .padding()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
