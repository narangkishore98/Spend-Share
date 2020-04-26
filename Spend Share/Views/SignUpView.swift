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
    @State private var otp = ""
    @State private var stepOneCleared = false
    
    
    
    var body: some View {
        VStack(){
            Text("Spend & Share")
                .font(.largeTitle)
            Text("Sign Up")
            Divider().padding()
            if !stepOneCleared
            {
                SignUpPartOne(fullname: $fullname, mobileNumber: $mobileNumber,otp: $otp, stepOneCleared:$stepOneCleared)
            }
            else{
                 SignUpPartTwo(mobileNumber: $mobileNumber, otp: $otp)
            }
           
        }
        .padding()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

struct SignUpPartOne: View {
    @Binding var fullname:String
    @Binding var mobileNumber:String
    @Binding var otp:String
    @Binding var stepOneCleared:Bool
    @State private var notValid:Bool = false
    var body: some View {
        VStack(){
            TextField("Full Name", text: $fullname).textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Mobile Number", text: $mobileNumber).textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                
                
                if !self.fullname.isValidName || !self.mobileNumber.isValidMobileNumber
                {
                    self.notValid = true
                }
                else
                {
                    self.notValid = false
                    self.stepOneCleared = true
                    self.otp = "\(DataStore.getOTP())"
                    print(self.otp)
                    
                    
                }
                        
            })
            {
                Text("Sign Up")
                    .alert(isPresented: $notValid, content: {
                        Alert(title: Text("Please Enter the Valid Information"), message: Text("The Entered Information is incorrect please enter the correct information"), dismissButton: .default(Text("OK")))
                    })
            }
            .padding(5)
            .foregroundColor(Color.white)
            .frame(minWidth: 0,  maxWidth:.infinity )
                
            .background(Color.blue)
            .cornerRadius(7)
           
            
        }
    }
}

struct SignUpPartTwo: View {
    @Binding var mobileNumber:String
    @Binding var otp:String
    var body: some View {
       
        VStack(){
            TextField("Enter OTP sent at \(mobileNumber)", text: $otp)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
        }
    }
}
