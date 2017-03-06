//
//  InviteService.swift
//  changegamer
//
//  Created by Kenan Pulak on 2/26/17.
//  Copyright © 2017 Kenan Pulak. All rights reserved.
//

import Foundation
import Parse

class InviteService {
    
    class func inviteBeeKeeper(beeKeeper: BeeKeeperModel, hiveID: String, completion: @escaping (_ success: Bool, _ failure: NSError) -> Void){ //-> (success: Bool, error: Bool){
        
        let invite = PFObject(className: "Invite")
        invite.setObject(beeKeeper.firstName ?? "", forKey: "firstName")
        invite.setObject(hiveID, forKey: "hiveID")
        
        let randomizedToken = randomString(length: 6)
        invite.setObject(randomizedToken, forKey: "code")
        
        let email = beeKeeper.email
        if (email != nil){
        invite.setObject(email ?? "", forKey: "email")
        }
        invite.setObject(true, forKey: "isPending")
        
        invite.saveInBackground(block: { (success, error) -> Void in
            if let error = error {
                if let errorString = (error as NSError).userInfo["error"] as? String {
                    NSLog(errorString);
                   completion(false, error as NSError)
                }
            } else {
                NSLog("Invite Created");
                completion(true, NSError())
            }
        })
    }
    
    class func inviteHoneyBee(honeyBee: HoneyBeeModel, hiveID: String, completion: @escaping (_ success: Bool, _ failure: NSError) -> Void){ //-> (success: Bool, error: Bool){
        
        let invite = PFObject(className: "Invite")
        invite.setObject(honeyBee.firstName ?? "", forKey: "firstName")
        invite.setObject(hiveID, forKey: "hiveID")
        
        let randomizedToken = randomString(length: 6)
        invite.setObject(randomizedToken, forKey: "code")
        
        /*let email = honeyBee.email
        if (email != nil){
            invite.setObject(email ?? "", forKey: "email")
        }
        invite.setObject(true, forKey: "isPending")*/
        
        invite.saveInBackground(block: { (success, error) -> Void in
            if let error = error {
                if let errorString = (error as NSError).userInfo["error"] as? String {
                    NSLog(errorString);
                    completion(false, error as NSError)
                }
            } else {
                NSLog("Invite Created");
                completion(true, NSError())
            }
        })
    }
}

