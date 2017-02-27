//
//  AuthService.swift
//  changegamer
//
//  Created by Kenan Pulak on 10/30/16.
//  Copyright © 2016 Kenan Pulak. All rights reserved.
//

import Foundation
import Parse

class AuthService {
    
    class func isAuthenticated() -> Bool {
        
        if (PFUser.current() != nil){
            return true
        }
        return false;
    }
}
