//
//  AppDelegate.swift
//  changegamer
//
//  Created by Kenan Pulak on 10/14/16.
//  Copyright © 2016 Kenan Pulak. All rights reserved.
//

import UIKit
import Parse
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        Fabric.with([Crashlytics.self])
        
        let configuration = ParseClientConfiguration {
            $0.applicationId = "be23504781f842fca0044d88e214151c"
            $0.clientKey = ""
            $0.server = "https://changegamer.herokuapp.com/parse"
        }
        Parse.initialize(with: configuration)
        
        UINavigationBar.appearance().tintColor = UIColor.init(.HiveBlack)
        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "back-image");
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "back-image")
        
        let navbarFont = graphikRegularWithSize(size: 24) 
        
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: navbarFont, NSForegroundColorAttributeName:UIColor.init(.HiveBlack)]

        UITextField.appearance().font = graphikRegularWithSize(size: 18);
        UITextField.appearance().textColor = UIColor.init(.HiveBlack)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = self.window {
            
            let navigationController = UINavigationController()
            
            if AuthService.isAuthenticated(){
                navigationController.viewControllers = [MainViewController()]
            }
            else{
                navigationController.viewControllers = [InitialViewController()]
            }
            
            window.rootViewController = navigationController
            window.backgroundColor = UIColor.white
            window.makeKeyAndVisible()
        }
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

