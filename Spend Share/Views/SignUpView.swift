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
    @State private var generatedOtp = ""
    @State private var stepOneCleared = false
  
    
    
    var body: some View {
        VStack(){
            Text("Spend & Share")
                .font(.largeTitle)
                .padding(.top, 40)
            Text("Sign Up")
            Divider().padding()
            if !stepOneCleared
            {
                SignUpPartOne(fullname: $fullname, mobileNumber: $mobileNumber, stepOneCleared:$stepOneCleared, generatedOtp: $generatedOtp )
            }
            else{
                SignUpPartTwo(mobileNumber: $mobileNumber, fullName: $fullname, generatedOtp: $generatedOtp)
            }
            Spacer()
            Text("Application Version 1.0")
           
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
    
    @Binding var stepOneCleared:Bool
    @Binding var generatedOtp:String
    @State private var notValid:Bool = false
    
    @State private var alreadyExist:Bool = false
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
                    
                    print(DataStore.checkIfExists(mobileNumber: self.mobileNumber) )
                    
                    if DataStore.checkIfExists(mobileNumber: self.mobileNumber) == true
                    {
                        print("User ALready Exists")
                        //show alert that user already exists try login
                        self.alreadyExist = true
                        self.stepOneCleared = false
                    }
                    else
                    {
                        //send them an otp
                        self.generatedOtp = "\(DataStore.getOTP())"
                        print(self.generatedOtp)
                        self.stepOneCleared = true
                    }
                    
                    
                    
                }
                        
            })
            {
                Text("Sign Up")
                    .alert(isPresented: $notValid, content: {
                        Alert(title: Text("Please Enter the Valid Information"), message: Text("The Entered Information is incorrect please enter the correct information"), dismissButton: .default(Text("OK")))
                    })
                .alert(isPresented: $alreadyExist, content: {
                    Alert(title: Text("User Already Exists"), message: Text("Our Database already have an account with mobile number +1 \(mobileNumber). Please Try Login"), dismissButton: .default(Text("OK")))
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
    @Binding var fullName:String
    @State var otp:String = ""
    @Binding var generatedOtp:String
    @State var incorrectOTP = false
    var body: some View {
       
        VStack(){
            TextField("Enter OTP sent at \(mobileNumber)", text: $otp)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            
            Button(action: {
                
                if(self.generatedOtp == self.otp)
                {
                    print("Verified")
                    DataStore.signUp(fullName: self.fullName , mobileNumber: self.mobileNumber)
                }
                else
                {
                    self.incorrectOTP = true
                }
            })
            {
                Text("Verify My Number")
                    .alert(isPresented: $incorrectOTP, content: {
                        Alert(title: Text("OTP Validation"),message: Text("The Entered OTP is incorrect, please try again entering the correct OTP"), dismissButton: .default(Text("OK")))
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
