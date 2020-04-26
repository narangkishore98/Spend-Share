//
//  DataStore.swift
//  Spend Share
//
//  Created by Kishore Narang on 2020-04-26.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import Foundation
class DataStore
{
    static func getOTP() -> Int
    {
        //OTP is one time password used to sign up
        // OTP is generated as a random  number which will be valid untill the app is open.
     
        return Int.random(in: 10000000..<99999999)
    }
    
    
    static func signUp() -> Bool
    {
        return true
    }
}
