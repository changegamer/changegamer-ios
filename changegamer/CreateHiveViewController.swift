//
//  CreateHiveViewController.swift
//  changegamer
//
//  Created by Kenan Pulak on 1/29/17.
//  Copyright © 2017 Kenan Pulak. All rights reserved.
//

import UIKit
import SnapKit
import pop

class CreateHiveViewController: UIViewController {
    
    var window: UIWindow?
    var familyNameTextField: UITextField?
    var addMembersButton: UIButton?
    
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
        self.navigationItem.title = "Create Hive"
        
        let welcomeLabel = UILabel()
        welcomeLabel.font = graphikLightWithSize(size: 18)
        welcomeLabel.text = "Welcome! Give your Hive a name."
        welcomeLabel.backgroundColor = UIColor.clear
        welcomeLabel.textAlignment = NSTextAlignment.center
        welcomeLabel.textColor = UIColor.init(.HiveBlack)
        view.addSubview(welcomeLabel)
        
        welcomeLabel.snp.makeConstraints { (make) -> Void in
            make.leadingMargin.equalTo(0)
            make.trailingMargin.equalTo(0)
            make.top.equalTo(70)
            make.height.equalTo(18)
            make.centerX.equalTo(self.view.center.x)
        }
        
        let hiveImageView = UIImageView.init(image: #imageLiteral(resourceName: "beehive-medium"))
        view.addSubview(hiveImageView)
        
        hiveImageView.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.view.center.x)
            make.top.equalTo(134)
            make.height.equalTo(149)
            make.width.equalTo(146)
        }
        
        let multipleAttributes: [String : Any] = [
            NSForegroundColorAttributeName: UIColor.init(.HiveGray),
            NSFontAttributeName: UIFont(name: "Graphik-Light", size: 18.0)! ]
        
        familyNameTextField = UITextField()
        familyNameTextField?.attributedPlaceholder = NSAttributedString.init(string: "i.e. The Zanders", attributes: multipleAttributes)
        familyNameTextField?.textColor = UIColor.init(.HiveBlack)
        familyNameTextField?.font = graphikLightWithSize(size: 18.0)
        familyNameTextField?.autocorrectionType = UITextAutocorrectionType.no
        familyNameTextField?.clipsToBounds = true
        
        familyNameTextField?.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

        view.addSubview(familyNameTextField!)
        
        familyNameTextField?.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(320)
            make.height.equalTo(44)
            make.leadingMargin.equalTo(15)
            make.trailingMargin.equalTo(15)
            make.centerX.equalTo(self.view.center.x)
        }
        
        let familyNameLowerBorder = CALayer()
        familyNameLowerBorder.backgroundColor = UIColor.init(.HiveBorder).cgColor
        familyNameLowerBorder.frame = CGRect(x: 0, y: 43, width: self.view.frame.size.width-30, height: 1.0)
        familyNameTextField?.layer.addSublayer(familyNameLowerBorder)

        addMembersButton = UIButton(type: UIButtonType.custom)
        addMembersButton?.setTitle("Add Members", for: UIControlState.normal)
        addMembersButton?.setTitleColor(UIColor.white, for: UIControlState.normal)
        addMembersButton?.backgroundColor = UIColor.init(.HiveOrange)
        addMembersButton?.addTarget(self, action: #selector(addMembersButtonPressed), for: .touchUpInside)
        addMembersButton?.titleLabel?.font = graphikRegularWithSize(size: 22)
        addMembersButton?.alpha = 0.5
        addMembersButton?.isEnabled = false
        view.addSubview(addMembersButton!)
        
        addMembersButton?.snp.makeConstraints { (make) -> Void in
            make.leadingMargin.equalTo(-10)
            make.trailingMargin.equalTo(-10)
            make.bottom.equalTo(-216)
            make.height.equalTo(55)
            make.centerX.equalTo(self.view.center.x)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        familyNameTextField?.becomeFirstResponder()
        
    }
    
    func textFieldDidChange(_ textField: UITextField) {
        
        if textField.text?.characters.count == 0
        {
            addMembersButton?.isEnabled = false
            addMembersButton?.alpha = 0.5
        }
        else
        {
            addMembersButton?.isEnabled = true
            addMembersButton?.alpha = 1.0
        }
    }
    
    func addMembersButtonPressed ()
    {
        
        let hiveModel = HiveModel()
        hiveModel.hiveName = familyNameTextField?.text
        HiveCreationService.sharedInstance.hiveModel = hiveModel
        
        print("Add Members Pressed with name: \(familyNameTextField?.text)")
        let createBeeKeeperViewController = CreateBeeKeeperViewController()
        createBeeKeeperViewController.beeKeeperType = .head
        
        self.navigationController?.pushViewController(createBeeKeeperViewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
