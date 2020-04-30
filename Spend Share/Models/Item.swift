//
//  Item.swift
//  Spend Share
//
//  Created by Kishore Narang on 2020-04-25.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import Foundation
class Item
{
    var name:String
    var count:Int
    var estimatedAmount:Float
    init(name:String, count:Int ,estimatedAmount:Float)
    {
        self.name = name
        self.count = count
        self.estimatedAmount = estimatedAmount
    }
}
