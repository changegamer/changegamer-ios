//
//  HoneyBeeModel.swift
//  changegamer
//
//  Created by Kenan Pulak on 2/24/17.
//  Copyright © 2017 Kenan Pulak. All rights reserved.
//

import Foundation
import Parse

class HoneyBeeModel: NSObject {
    
    var objectID : String?
    var firstName: String?
    var lastName: String?
    var dob : Date?
    var relationship: String?
    var email: String?
    var password: String?
    var confirm: String?
    var hiveID: String?
    
    
    override init()
    {
        super.init()
    }
    
    func updateWithObject(object: PFObject)
    {
        self.objectID = object.value(forKey: "objectID") as! String?
        self.relationship = object.value(forKey: "relationship") as! String?
        self.firstName = object.value(forKey: "firstName") as! String?
        self.lastName = object.value(forKey: "lastName") as! String?
        self.dob = object.value(forKey: "birthDate") as! Date?
        self.hiveID = object.value(forKey: "hiveID") as! String?
        self.email = object.value(forKey: "email") as! String?
    }
    
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
    
    func allFieldsEnteredSignUp() -> Bool
    {
        var emptyDate: Bool?
        if dob != nil{
            emptyDate = false
        }
        else
        {
            emptyDate = true
        }
        
        if (self.firstName.isNilOrEmpty || self.lastName.isNilOrEmpty || emptyDate! || self.relationship.isNilOrEmpty || self.email.isNilOrEmpty ||
            self.password.isNilOrEmpty || self.confirm.isNilOrEmpty)
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    func passwordsMatch() -> Bool
    {
        if self.password! == self.confirm! {
            return true;
        }
        else
        {
            return false;
        }
    }
}

