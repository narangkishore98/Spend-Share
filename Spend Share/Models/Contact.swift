//
//  Contact.swift
//  Spend Share
//
//  Created by Kishore Narang on 2020-04-25.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import Foundation
import SwiftUI
struct Contact : Identifiable, Equatable
{
    static func == (lhs: Contact, rhs: Contact) -> Bool {
       return true
    }
    
  
    
    
    @State var rowClicked = false
    var id = UUID()
    var contactNum:String
    var fullName:String
    var imageData:Data?
    var amountToPay:Float = 0.0
    init(number:String, fullName:String)
    {
        self.contactNum = number
        self.fullName = fullName
    }
}
