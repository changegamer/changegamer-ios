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
                        self.hiveModel?.objectID = hive.objectId
                        let userObject = PFObject(className: "UserObject")
                        userObject.setValue(self.hiveCreator?.firstName, forKey: "firstName")
                        userObject.setValue(self.hiveCreator?.lastName, forKey: "lastName")
                        userObject.setValue(self.hiveCreator?.dob, forKey: "birthDate")
                        userObject.setValue(self.hiveCreator?.relationship, forKey: "relationship")
                        userObject.setValue(hive.objectId, forKey: "hiveID")
                        userObject.setValue(self.hiveCreator?.email, forKey: "email")
                        userObject.setValue(self.hiveCreator?.type?.rawValue, forKey: "beeKeeperType")
                        userObject.setValue("beekeeper", forKey: "userType")
                        userObject.setValue(PFUser.current(), forKey: "user")
                        userObject.saveInBackground()
                    }
                })
            }
        }
    }
    
    func createBeeKeeper(beeKeeper:BeeKeeperModel, hiveID:String, completion: @escaping (_ userObject: PFObject ,_ success: Bool, _ failure: NSError) -> Void){
        
        let userObject = PFObject(className: "UserObject")
        userObject.setValue(beeKeeper.firstName!, forKey: "firstName")
        userObject.setValue(beeKeeper.lastName!, forKey: "lastName")
        userObject.setValue(beeKeeper.dob!, forKey: "birthDate")
        userObject.setValue(beeKeeper.relationship!, forKey: "relationship")
        userObject.setValue(hiveID, forKey: "hiveID")
        userObject.setValue(beeKeeper.type?.rawValue, forKey: "beeKeeperType")
        userObject.setValue(beeKeeper.email!, forKey: "email")
        userObject.setValue("beekeeper", forKey: "userType")
        
        userObject.saveInBackground(block: { (success, error) -> Void in
            if let error = error {
                if let errorString = (error as NSError).userInfo["error"] as? String {
                    NSLog(errorString);
                    completion(userObject,false,error as NSError)
                }
            } else {
                NSLog("Hive Created");
                completion(userObject,true, NSError())
            }
        })
    }
    
    func createHoneyBee(honeyBee:HoneyBeeModel, hiveID:String, completion: @escaping (_ userObject: PFObject ,_ success: Bool, _ failure: NSError) -> Void){
        
        let userObject = PFObject(className: "UserObject")
        userObject.setValue(honeyBee.firstName, forKey: "firstName")
        userObject.setValue(honeyBee.lastName, forKey: "lastName")
        userObject.setValue(honeyBee.dob, forKey: "birthDate")
        userObject.setValue(honeyBee.relationship, forKey: "relationship")
        userObject.setValue(hiveID, forKey: "hiveID")
        userObject.setValue("honeybee", forKey: "userType")
        
        userObject.saveInBackground(block: { (success, error) -> Void in
            if let error = error {
                if let errorString = (error as NSError).userInfo["error"] as? String {
                    NSLog(errorString);
                    completion(userObject,false,error as NSError)
                }
            } else {
                NSLog("Hive Created");
                completion(userObject,true, NSError())
            }
        })
    }
    
    func createUserAndUpdateUserObject(beeKeeper:BeeKeeperModel, completion: @escaping (_ userObject: PFObject ,_ success: Bool, _ failure: NSError) -> Void){
        
        let user = PFUser()
        user.username = beeKeeper.email
        user.email = beeKeeper.email
        user.password = beeKeeper.password
        user.signUpInBackground(){
            (success, error) -> Void in
            if let error = error {
                if let errorString = (error as NSError).userInfo["error"] as? String {
                    NSLog(errorString);
                }
            } else {
                // Hooray! Let them use the app now.
                NSLog("Signed up!");
                //update user Object
                let userObject = PFObject(withoutDataWithClassName: "UserObject", objectId: beeKeeper.objectID)
                userObject.setValue(beeKeeper.firstName!, forKey: "firstName")
                userObject.setValue(beeKeeper.lastName!, forKey: "lastName")
                userObject.setValue(beeKeeper.dob!, forKey: "birthDate")
                userObject.setValue(beeKeeper.relationship!, forKey: "relationship")
                userObject.setValue(beeKeeper.hiveID!, forKey: "hiveID")
                userObject.setValue(beeKeeper.type?.rawValue, forKey: "beeKeeperType")
                userObject.setValue(beeKeeper.email!, forKey: "email")
                userObject.setValue("beekeeper", forKey: "userType")
                userObject.setValue(PFUser.current(), forKey: "user")
                userObject.saveInBackground(block: { (success, error) -> Void in
                    if let error = error {
                        if let errorString = (error as NSError).userInfo["error"] as? String {
                            NSLog(errorString);
                            completion(userObject,false,error as NSError)
                        }
                    } else {
                        NSLog("User Updated");
                        completion(userObject,true, NSError())
                    }
                })
            }
        }
    }
    
    func createUserAndUpdateUserObject(honeyBee:HoneyBeeModel, completion: @escaping (_ userObject: PFObject ,_ success: Bool, _ failure: NSError) -> Void){
        let user = PFUser()
        user.username = honeyBee.email
        user.email = honeyBee.email
        user.password = honeyBee.password
        user.signUpInBackground(){
            (success, error) -> Void in
            if let error = error {
                if let errorString = (error as NSError).userInfo["error"] as? String {
                    NSLog(errorString);
                }
            } else {
                // Hooray! Let them use the app now.
                NSLog("Signed up!");
                //update user Object
                let userObject = PFObject(withoutDataWithClassName: "UserObject", objectId: honeyBee.objectID)
                userObject.setValue(honeyBee.firstName!, forKey: "firstName")
                userObject.setValue(honeyBee.lastName!, forKey: "lastName")
                userObject.setValue(honeyBee.dob!, forKey: "birthDate")
                userObject.setValue(honeyBee.relationship!, forKey: "relationship")
                userObject.setValue(honeyBee.hiveID!, forKey: "hiveID")
                userObject.setValue(honeyBee.email!, forKey: "email")
                userObject.setValue("honeybee", forKey: "userType")
                userObject.setValue(PFUser.current(), forKey: "user")
                userObject.saveInBackground(block: { (success, error) -> Void in
                    if let error = error {
                        if let errorString = (error as NSError).userInfo["error"] as? String {
                            NSLog(errorString);
                            completion(userObject,false,error as NSError)
                        }
                    } else {
                        NSLog("User Updated");
                        completion(userObject,true, NSError())
                    }
                })
            }
        }
    }
}
