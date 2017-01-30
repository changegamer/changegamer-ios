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

class InitialViewController: UIViewController {
    
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        window = UIWindow(frame: UIScreen.main.bounds)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(goToRootController),
            name: NSNotification.Name(rawValue: "kLogoutNotification"),
            object: nil)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        view.backgroundColor = UIColor.white
        self.navigationItem.backBarButtonItem?.title = " "
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backButton
        
        let honeycombBGImageView = UIImageView.init(image: #imageLiteral(resourceName: "honeycomb-login-bg"))
        view.addSubview(honeycombBGImageView)
        
        honeycombBGImageView.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(0)
            make.centerX.equalTo(self.view.center.x)
        }
        
        let theLabel = UILabel()
        theLabel.font = graphikLightWithSize(size: 24)
        theLabel.text = "the"
        theLabel.backgroundColor = UIColor.clear
        theLabel.textAlignment = NSTextAlignment.center
        theLabel.textColor = UIColor.init(.HiveBlack)
        view.addSubview(theLabel)
        
        let hiveLabel = UILabel()
        hiveLabel.font = graphikRegularWithSize(size: 75)
        hiveLabel.text = "hive"
        hiveLabel.backgroundColor = UIColor.clear
        hiveLabel.textAlignment = NSTextAlignment.center
        hiveLabel.textColor = UIColor.init(.HiveBlack)
        view.addSubview(hiveLabel)
        
        let hiveImageView = UIImageView.init(image: #imageLiteral(resourceName: "beehive-login"))
        view.addSubview(hiveImageView)
        
        theLabel.snp.makeConstraints { (make) -> Void in
            make.leadingMargin.equalTo(0)
            make.trailingMargin.equalTo(0)
            make.top.equalTo(66)
            make.height.equalTo(24)
            make.centerX.equalTo(self.view.center.x)
        }
        
        hiveLabel.snp.makeConstraints { (make) -> Void in
            make.leadingMargin.equalTo(0)
            make.trailingMargin.equalTo(0)
            make.top.equalTo(90)
            make.height.equalTo(75)
            make.centerX.equalTo(self.view.center.x)
        }
        
        hiveImageView.snp.makeConstraints { (make) -> Void in
            make.leadingMargin.equalTo(109)
            make.top.equalTo(203)
            make.height.equalTo(203)
            make.width.equalTo(204)
        }
        
        let signInButton = UIButton(type: UIButtonType.custom)
        signInButton.setTitle("Sign In", for: UIControlState.normal)
        signInButton.setTitleColor(UIColor.init(.HiveBlack), for: UIControlState.normal)
        signInButton.backgroundColor = UIColor.clear
        signInButton.addTarget(self, action: #selector(signInPressed), for: .touchUpInside)
        signInButton.titleLabel?.font = graphikRegularWithSize(size: 16)
        view.addSubview(signInButton)
        
        signInButton.snp.makeConstraints { (make) -> Void in
            make.leadingMargin.equalTo(15)
            make.trailingMargin.equalTo(15)
            make.bottom.equalTo(-20)
            make.height.equalTo(55)
            make.centerX.equalTo(self.view.center.x)
        }
        
        let joinHiveButton = UIButton(type: UIButtonType.custom)
        joinHiveButton.setTitle("Join Existing Hive", for: UIControlState.normal)
        joinHiveButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        joinHiveButton.backgroundColor = UIColor.init(.HiveYellow)
        joinHiveButton.addTarget(self, action: #selector(joinExistingHivePressed), for: .touchUpInside)
        joinHiveButton.titleLabel?.font = graphikRegularWithSize(size: 22)
        view.addSubview(joinHiveButton)
        
        joinHiveButton.snp.makeConstraints { (make) -> Void in
            make.leadingMargin.equalTo(15)
            make.trailingMargin.equalTo(15)
            make.bottom.equalTo(signInButton.snp.top).offset(-10)
            make.height.equalTo(55)
            make.centerX.equalTo(self.view.center.x)
        }
        
        let createHiveButton = UIButton(type: UIButtonType.custom)
        createHiveButton.setTitle("Create New Hive", for: UIControlState.normal)
        createHiveButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        createHiveButton.backgroundColor = UIColor.init(.HiveOrange)
        createHiveButton.addTarget(self, action: #selector(createNewHivePressed), for: .touchUpInside)
        createHiveButton.titleLabel?.font = graphikRegularWithSize(size: 22)
        view.addSubview(createHiveButton)
        
        createHiveButton.snp.makeConstraints { (make) -> Void in
            make.leadingMargin.equalTo(15)
            make.trailingMargin.equalTo(15)
            make.bottom.equalTo(joinHiveButton.snp.top).offset(-10)
            make.height.equalTo(55)
            make.centerX.equalTo(self.view.center.x)
        }
    }
    
    func createNewHivePressed()
    {
        print("Create New Hive Pressed");
    }
    
    func joinExistingHivePressed()
    {
        print("Join Existing Hive Pressed");
    }
    
    func signInPressed()
    {
        print("Sign In Pressed");
        self.navigationController?.pushViewController(LoginViewController(), animated: true)

    }
    
    func goToRootController()
    {
        print("Go to Root Controller");
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

