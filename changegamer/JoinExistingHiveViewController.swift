//
//  JoinExistingHiveViewController.swift
//  changegamer
//
//  Created by Kenan Pulak on 1/29/17.
//  Copyright © 2017 Kenan Pulak. All rights reserved.
//

import UIKit
import SnapKit
import pop

class JoinExistingHiveViewController: UIViewController {
    
    var window: UIWindow?
    let inviteCodeTextField = UITextField()
    let signUpButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        window = UIWindow(frame: UIScreen.main.bounds)
        
        view.backgroundColor = UIColor.white
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.isNavigationBarHidden = false
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backButton
        self.navigationItem.title = "Join Existing Hive"
        
        let hiveImageView = UIImageView.init(image: #imageLiteral(resourceName: "beehive-medium"))
        hiveImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hiveImageView)
        
        let enterCodeLabel = UILabel()
        enterCodeLabel.font = graphikLightWithSize(size: 18)
        enterCodeLabel.text = "Please Enter Code"
        enterCodeLabel.backgroundColor = UIColor.clear
        enterCodeLabel.textAlignment = NSTextAlignment.center
        enterCodeLabel.textColor = UIColor.init(.HiveBlack)
        enterCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(enterCodeLabel)
        
        self.inviteCodeTextField.textColor = UIColor.init(.HiveBlack)
        self.inviteCodeTextField.font = graphikMediumWithSize(size: 18.0)
        self.inviteCodeTextField.autocorrectionType = UITextAutocorrectionType.no
        self.inviteCodeTextField.clipsToBounds = true
        self.inviteCodeTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        self.inviteCodeTextField.translatesAutoresizingMaskIntoConstraints = false
        self.inviteCodeTextField.layer.borderWidth = 2
        self.inviteCodeTextField.layer.borderColor = UIColor.init(.HiveOrange).cgColor
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: self.inviteCodeTextField.frame.width))
        self.inviteCodeTextField.leftView = paddingView
        self.inviteCodeTextField.leftViewMode = UITextFieldViewMode.always
        
        view.addSubview(self.inviteCodeTextField)
        
        self.signUpButton.setTitle("Sign Up", for: UIControlState.normal)
        self.signUpButton.setTitleColor(UIColor.init(.HiveOrange), for: UIControlState.normal)
        self.signUpButton.addTarget(self, action: #selector(signUpPressed), for: .touchUpInside)
        self.signUpButton.titleLabel?.font = graphikMediumWithSize(size: 18.0)
        self.signUpButton.alpha = 0.5
        self.signUpButton.isEnabled = false
        self.signUpButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self.signUpButton)
        
        NSLayoutConstraint.activate([hiveImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                     hiveImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 130.0),
                                     hiveImageView.widthAnchor.constraint(equalToConstant: 120),
                                     hiveImageView.heightAnchor.constraint(equalToConstant: 120),
                                     enterCodeLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                     enterCodeLabel.topAnchor.constraint(equalTo: hiveImageView.bottomAnchor, constant: 20.0),
                                     enterCodeLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15),
                                     enterCodeLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -15),
                                     enterCodeLabel.heightAnchor.constraint(equalToConstant: 18),
                                     self.inviteCodeTextField.topAnchor.constraint(equalTo: enterCodeLabel.bottomAnchor, constant: 30),
                                     self.inviteCodeTextField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 60),
                                     self.inviteCodeTextField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -60),
                                     self.inviteCodeTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                     self.inviteCodeTextField.heightAnchor.constraint(equalToConstant: 40),
                                     self.signUpButton.topAnchor.constraint(equalTo: self.inviteCodeTextField.bottomAnchor, constant: 20),
                                     self.signUpButton.widthAnchor.constraint(equalToConstant: 44),
                                     self.signUpButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15),
                                     self.signUpButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -15)
            ])
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.inviteCodeTextField.becomeFirstResponder()
    }
    
    func textFieldDidChange(_ textField: UITextField) {
        
        if textField.text?.characters.count == 6
        {
            signUpButton.isEnabled = true
            signUpButton.alpha = 1.0
        }
        else
        {
            signUpButton.isEnabled = false
            signUpButton.alpha = 0.5
        }
    }
    
    func signUpPressed ()
    {
        if self.inviteCodeTextField.text?.characters.count != 6 {
            let alertController = UIAlertController(title: "Invite Code Error!", message: "Invite code must be 6 characters", preferredStyle: UIAlertControllerStyle.alert)
            
            // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                (result : UIAlertAction) -> Void in
                print("OK")
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else{
            InviteService.confirmInviteCode(code: self.inviteCodeTextField.text!) { (userObject, success, error) in
                
                if success == true{
                    
                    var beeKeeper: BeeKeeperModel?
                    var honeyBee: HoneyBeeModel?
                    
                    if userObject.value(forKey: "userType") as! String == "beekeeper"{
                        beeKeeper = BeeKeeperModel.init()
                        beeKeeper?.updateWithObject(object: userObject)
                        honeyBee = nil
                    }
                    else if userObject.value(forKey: "userType") as! String == "honeybee"{
                        honeyBee = HoneyBeeModel.init()
                        honeyBee?.updateWithObject(object: userObject)
                        beeKeeper = nil
                    }
                    
                    let joinHiveFinishSignupViewController = JoinHiveFinishSignupViewController()
                    joinHiveFinishSignupViewController.beeKeeperModel = beeKeeper
                    joinHiveFinishSignupViewController.honeyBeeModel = honeyBee
                    
                    self.navigationController?.pushViewController(joinHiveFinishSignupViewController, animated: true)
                }
                else{
                    
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
