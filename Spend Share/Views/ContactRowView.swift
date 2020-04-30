//
//  ContactRowView.swift
//  Spend Share
//
//  Created by Kishore Narang on 2020-04-29.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import SwiftUI
import UIKit

struct ContactRowView: View {
    
    var contact:Contact
    

    
    
    func image() -> Image
    {
        if let _ = contact.imageData
        {
            return Image(uiImage: UIImage(data: contact.imageData!)!)
        }
        else
        {
            return Image(systemName: "person.circle")
        }
    }
    
    var body: some View {

        HStack(){
            Image(systemName:"person.circle")
                .font(.largeTitle)
                .frame(width:50,height:50)
            VStack(alignment: .leading)
            {
                Text(contact.fullName).font(.system(size: 22))
                Text(contact.contactNum)
                    .foregroundColor(.secondary)
            }
            Spacer()
            
          
        }

    }
}

struct ContactRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContactRowView(contact: Contact(number: "647-763-9826", fullName: "Kishore Narang"))
    }
}





