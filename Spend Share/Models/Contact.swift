//
//  Contact.swift
//  Spend Share
//
//  Created by Kishore Narang on 2020-04-25.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import Foundation
import SwiftUI

struct Contact : Identifiable, Hashable
{
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        return lhs.contactNum == rhs.contactNum
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(fullName+contactNum)
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
