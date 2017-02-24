//
//  BeeKeeperModel.swift
//  changegamer
//
//  Created by Kenan Pulak on 2/12/17.
//  Copyright © 2017 Kenan Pulak. All rights reserved.
//

import Foundation

protocol OptionalString {}
extension String: OptionalString {}

extension Optional where Wrapped: OptionalString {
    var isNilOrEmpty: Bool {
        return ((self as? String) ?? "").isEmpty
    }
}

class BeeKeeperModel: NSObject {

    var firstName: String?
    var lastName: String?
    var dob : Date?
    var relationship: String?
    var email: String?
    var password: String?
    var confirm: String?
    var type: BeeKeeperType?
    
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
    
    func allNormalFieldsEntered() -> Bool
    {
        var emptyDate: Bool?
        if dob != nil{
            emptyDate = false
        }
        else
        {
            emptyDate = true
        }
        
        if (self.firstName.isNilOrEmpty || self.lastName.isNilOrEmpty || emptyDate! || self.relationship.isNilOrEmpty || self.email.isNilOrEmpty)
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
