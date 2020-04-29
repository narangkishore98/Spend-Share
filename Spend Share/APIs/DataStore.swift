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
import Contacts
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
    
    
    static func getContacts() -> [Contact]
    {
        let contactStore = CNContactStore()
        let keysToFetch = [
                           CNContactPhoneNumbersKey,
                           CNContactThumbnailImageDataKey,
                           CNContactGivenNameKey,
            ] as [CNKeyDescriptor]
        
        var allContainers : [CNContainer] = []
        
        do{
            allContainers = try contactStore.containers(matching: nil)
            
        }
        catch
        {
            print("Unable To Fetch Contacts")
        }
        
        var results : [Contact] = []
        for container in allContainers
        {
            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier:container.identifier)
            
            do
            {
                let containerResult = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch)
                
                    for res in containerResult
                    {
                        
                        
                        for num in  res.phoneNumbers
                        {
                            results.append(Contact(number: num.value.stringValue, fullName: res.givenName))
                        }
                }
            }
            catch
            {
                print("Unable to fetch from containers")
            }
        }
        
        return results
        
        
    }
}
