//
//  LoginViewController.swift
//  changegamer
//
//  Created by Kenan Pulak on 1/28/17.
//  Copyright © 2017 Kenan Pulak. All rights reserved.
//

import UIKit
import SnapKit
import pop

class LoginViewController: UIViewController {
    
    var window: UIWindow?

    override func viewDidLoad() {
        super.viewDidLoad()
        window = UIWindow(frame: UIScreen.main.bounds)

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backButton
        self.navigationItem.title = "Sign In"
        view.backgroundColor = UIColor.white
        
        let hiveImageView = UIImageView.init(image: #imageLiteral(resourceName: "beehive-small"))
        view.addSubview(hiveImageView)
        
        hiveImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(92)
            make.height.equalTo(99)
            make.width.equalTo(97)
            make.centerX.equalTo(self.view.center.x)
        }
        
        let multipleAttributes: [String : Any] = [
            NSForegroundColorAttributeName: UIColor.init(.HiveGray),
            NSFontAttributeName: UIFont(name: "Graphik-Light", size: 18.0)! ]
 
        let userTextField = UITextField()
        userTextField.attributedPlaceholder = NSAttributedString.init(string: "Username", attributes: multipleAttributes)
        userTextField.textColor = UIColor.init(.HiveGray)
        userTextField.font = graphikLightWithSize(size: 18.0)
        userTextField.autocorrectionType = UITextAutocorrectionType.no
        view.addSubview(userTextField)
        
        userTextField.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(240)
            make.height.equalTo(44)
            make.leadingMargin.equalTo(15)
            make.trailingMargin.equalTo(15)
            make.centerX.equalTo(self.view.center.x)
        }
        
        let passwordTextField = UITextField()
        passwordTextField.attributedPlaceholder = NSAttributedString.init(string: "Password", attributes: multipleAttributes)
        passwordTextField.textColor = UIColor.init(.HiveGray)
        passwordTextField.font = graphikLightWithSize(size: 18.0)
        passwordTextField.autocorrectionType = UITextAutocorrectionType.no
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
        
        passwordTextField.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(300)
            make.height.equalTo(44)
            make.leadingMargin.equalTo(15)
            make.trailingMargin.equalTo(15)
            make.centerX.equalTo(self.view.center.x)
        }
        
        let usernameLowerBorder = CALayer()
        usernameLowerBorder.backgroundColor = UIColor.init(.HiveBorder).cgColor
        usernameLowerBorder.frame = CGRect(x: 0, y: 43, width: self.view.frame.size.width-30, height: 1.0)
        userTextField.layer.addSublayer(usernameLowerBorder)
        
        let passwordLowerBorder = CALayer()
        passwordLowerBorder.backgroundColor = UIColor.init(.HiveBorder).cgColor
        passwordLowerBorder.frame = CGRect(x: 0, y: 43, width: self.view.frame.size.width-30, height: 1.0)
        passwordTextField.layer.addSublayer(passwordLowerBorder)
        
        let signInButton = UIButton(type: UIButtonType.custom)
        signInButton.setTitle("Sign In", for: UIControlState.normal)
        signInButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        signInButton.backgroundColor = UIColor.init(.HiveYellow)
        signInButton.addTarget(self, action: #selector(signInPressed), for: .touchUpInside)
        signInButton.titleLabel?.font = graphikRegularWithSize(size: 22)
        view.addSubview(signInButton)
        
        signInButton.snp.makeConstraints { (make) -> Void in
            make.leadingMargin.equalTo(-10)
            make.trailingMargin.equalTo(-10)
            make.top.equalTo(396)
            make.height.equalTo(55)
            make.centerX.equalTo(self.view.center.x)
        }
        
    }
    
    func signInPressed()
    {
        print("Sign In Pressed");
        let navMainViewController: UINavigationController = UINavigationController(rootViewController: MainViewController())
        self.navigationController?.present(navMainViewController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
