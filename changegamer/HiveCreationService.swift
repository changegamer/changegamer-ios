//
//  HiveCreationService.swift
//  changegamer
//
//  Created by Kenan Pulak on 2/4/17.
//  Copyright © 2017 Kenan Pulak. All rights reserved.
//

import Foundation
import Parse

class HiveCreationService {
    
    static let sharedInstance = HiveCreationService()
    
    var hiveModel: HiveModel?
    var hiveCreator: BeeKeeperModel?
    
    func createUserAndHive() {
        
        let user = PFUser()
        user.username = hiveCreator?.email
        user.email = hiveCreator?.email
        user.password = hiveCreator?.password
        user.signUpInBackground(){
        (success, error) -> Void in
        if let error = error {
            if let errorString = (error as NSError).userInfo["error"] as? String {
                NSLog(errorString);
            }
        } else {
            // Hooray! Let them use the app now.
            NSLog("Signed up!");
            //create Hive Object
            let hive = PFObject(className: "Hive")
            hive.setObject((self.hiveModel?.hiveName!)! as String, forKey: "hiveName")
            hive.saveInBackground(block: { (success, error) -> Void in
                if let error = error {
                    if let errorString = (error as NSError).userInfo["error"] as? String {
                        NSLog(errorString);
                    }
                } else {
                    NSLog("Hive Created");
                }
            })
        }
        }
    }
    
}
