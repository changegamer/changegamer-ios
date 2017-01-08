//
//  LoginViewController.swift
//  changegamer
//
//  Created by Kenan Pulak on 10/30/16.
//  Copyright © 2016 Kenan Pulak. All rights reserved.
//

import UIKit
import SnapKit
import pop

class LoginViewController: UIViewController {
    
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        window = UIWindow(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.white
        
        let myView = UIView(frame: CGRect(x: 0, y: 20, width: (self.window?.frame.width)!, height: 300))
        
        myView.backgroundColor = UIColor.red
        view.addSubview(myView)
        
        let loginButton = UIButton(type: UIButtonType.custom)
        loginButton.setTitle("Log In", for: UIControlState.normal)
        loginButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        loginButton.backgroundColor = UIColor.init(.HiveYellow)
        view.addSubview(loginButton)
        
        loginButton.snp.makeConstraints { (make) -> Void in
            make.leadingMargin.equalTo(15)
            make.trailingMargin.equalTo(15)
            make.bottom.equalTo(-60)
            make.height.equalTo(55)
            make.centerX.equalTo(self.view.center.x)
        }
    }
    
    func createNewHiveAction(){
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

