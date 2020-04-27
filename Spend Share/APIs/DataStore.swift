//
//  DataStore.swift
//  Spend Share
//
//  Created by Kishore Narang on 2020-04-26.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import Foundation
import FirebaseDatabase
import SwiftUI
class DataStore
{
    
    static var backgrounds:[[Color]] = [[.red,.pink],[.yellow,.orange]]
    
    static func getOTP() -> Int
    {
        //OTP is one time password used to sign up
        // OTP is generated as a random  number which will be valid untill the app is open.
     
        return Int.random(in: 10000000..<99999999)
    }
    
    static func checkIfExists(mobileNumber:String)->Bool
    {
        var returner:Bool = false
        var ref : DatabaseReference!
               
               ref = Database.database().reference()
               ref.child("users").observeSingleEvent(of: .value, with: {(snapshot) in
                   let users = snapshot.value as! NSDictionary
                   
                   for key in users.allKeys
                   {
                    //print("Checking: \(key) == \(mobileNumber)")
                    if "\(key)" == mobileNumber
                       {
                        print("True")
                        returner = true
                        break
                       }
                   }
               })
        print(returner)
        return returner
    }
    static func signUp(fullName:String, mobileNumber:String) -> Bool
    {
        
        
        var ref : DatabaseReference!
        
        ref = Database.database().reference()
        
        ref.child("users").child(mobileNumber).setValue(["fullName":fullName, "amount":0])
        return true
    }
}
