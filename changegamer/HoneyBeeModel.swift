//
//  HoneyBeeModel.swift
//  changegamer
//
//  Created by Kenan Pulak on 2/24/17.
//  Copyright © 2017 Kenan Pulak. All rights reserved.
//

import Foundation

class HoneyBeeModel: NSObject {
    
    var firstName: String?
    var lastName: String?
    var dob : Date?
    var relationship: String?
    
    func allFieldsEntered() -> Bool
    {
        var emptyDate: Bool?
        if dob != nil{
            emptyDate = false
        }
        else
        {
            emptyDate = true
        }
        
        if (self.firstName.isNilOrEmpty || self.lastName.isNilOrEmpty || emptyDate! || self.relationship.isNilOrEmpty)
        {
            return false
        }
        else
        {
            return true
        }
    }
}

