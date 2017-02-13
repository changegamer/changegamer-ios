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
        
        return false;
    }
    
    func myMethod() {
        let user = PFUser()
        user.username = "myUsername"
        user.password = "myPassword"
        user.email = "email@example.com"
        // other fields can be set just like with PFObject
        user["phone"] = "415-392-0202"
        
        /*user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
            } else {
                // Hooray! Let them use the app now.
            }
        }*/
        
    }
    
}
