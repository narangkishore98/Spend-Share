//
//  String.swift
//  Spend Share
//
//  Created by Kishore Narang on 2020-04-26.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import Foundation

extension String
{
    var isValidName : Bool
    {
        get{
            
            if !self.isEmpty
            {
                return true
            }
            return false
        }
    }
    var isValidMobileNumber : Bool{
        get{
            if self.count == 10
            {
                if let _ = Int(self)
                {
                    return true
                }
                return false
            }
            return false
        }
    }
}
