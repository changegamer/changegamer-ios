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
    
    class func inviteBeeKeeper(beeKeeper: BeeKeeperModel, hiveID: String, completion: @escaping (_ firstName: String, _ email: String, _ inviteCode:String, _ success: Bool, _ failure: NSError) -> Void){ //-> (success: Bool, error: Bool){
        
        let invite = PFObject(className: "Invite")
        invite.setObject(beeKeeper.firstName ?? "", forKey: "firstName")
        invite.setObject(hiveID, forKey: "hiveID")
        
        let randomizedToken = randomString(length: 6)
        invite.setObject(randomizedToken, forKey: "code")
        let userObject = PFObject(withoutDataWithClassName: "UserObject", objectId: beeKeeper.objectID)
        invite.setObject(userObject, forKey: "userObject")
        
        let email = beeKeeper.email
        if (email != nil){
        invite.setObject(email ?? "", forKey: "email")
        }
        invite.setObject(true, forKey: "isPending")
        
        invite.saveInBackground(block: { (success, error) -> Void in
            if let error = error {
                if let errorString = (error as NSError).userInfo["error"] as? String {
                    NSLog(errorString);
                   completion(beeKeeper.firstName!, beeKeeper.email!, randomizedToken ,false, error as NSError)
                }
            } else {
                NSLog("Invite Created");
                completion(beeKeeper.firstName!, beeKeeper.email!, randomizedToken, true, NSError())
            }
        })
    }
    
    class func inviteHoneyBee(honeyBee: HoneyBeeModel, hiveID: String, completion: @escaping (_ firstName: String, _ inviteCode: String, _ success: Bool, _ failure: NSError) -> Void){ //-> (success: Bool, error: Bool){
        
        let invite = PFObject(className: "Invite")
        invite.setObject(honeyBee.firstName ?? "", forKey: "firstName")
        invite.setObject(hiveID, forKey: "hiveID")
        
        let randomizedToken = randomString(length: 6)
        invite.setObject(randomizedToken, forKey: "code")
        let userObject = PFObject(withoutDataWithClassName: "UserObject", objectId: honeyBee.objectID)
        invite.setObject(userObject, forKey: "userObject")
        
        /*let email = honeyBee.email
        if (email != nil){
            invite.setObject(email ?? "", forKey: "email")
        }
        invite.setObject(true, forKey: "isPending")*/
        
        invite.saveInBackground(block: { (success, error) -> Void in
            if let error = error {
                if let errorString = (error as NSError).userInfo["error"] as? String {
                    NSLog(errorString);
                    completion(honeyBee.firstName!, randomizedToken, false, error as NSError)
                }
            } else {
                NSLog("Invite Created");
                completion(honeyBee.firstName!, randomizedToken,true, NSError())
            }
        })
    }
    
    class func confirmInviteCode(code: String, completion: @escaping (_ userModel: PFObject, _ success: Bool, _ failure: NSError) -> Void){
        
        /*
         PFQuery *query = [PFQuery queryWithClassName:@"Target"];
         query.limit = 1000;
         [query whereKey:@"user" equalTo:[PFUser currentUser]];
         [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
 */
        
        let inviteQuery = PFQuery(className: "Invite")
        inviteQuery.limit = 1
        inviteQuery.whereKey("code", equalTo: code.uppercased())
        inviteQuery.includeKey("userObject")
        inviteQuery.findObjectsInBackground {
            (objects, error) -> Void in
            if (error == nil) {
                
                if let inviteObject: PFObject = (objects?.first){
                    let userObjectWithoutData = inviteObject["userObject"] as! PFObject;
                    userObjectWithoutData.fetchIfNeededInBackground(block: { (userObject, error) in
                        
                        if (error == nil){
                            completion(userObject!, true, NSError())
                        }
                        
                        completion(PFObject(), false, error as! NSError)
                    })
                    
                }
                
                completion(PFObject(), false, NSError())
                
            }else {


                completion(PFObject(), false, NSError())

            }
        }
    }
}

