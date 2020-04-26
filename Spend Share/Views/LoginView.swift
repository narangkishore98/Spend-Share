//
//  LoginView.swift
//  Spend Share
//
//  Created by Kishore Narang on 2020-04-25.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import SwiftUI

struct LoginView: View {
   
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Text("Spend & Share")
                .font(.largeTitle)
            Divider().padding()
            TextField("Enter Username", text:$username).textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Enter Password",text: $password).textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action:{
                UserDefaults.standard.set(self.$username.wrappedValue, forKey: "username")
                UserDefaults.standard.set(self.$password.wrappedValue, forKey: "password")
                UserDefaults.standard.set(true, forKey: "isLoggedIn")
            }){
                Text("Login")
            }
        }.padding()
        
            
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
