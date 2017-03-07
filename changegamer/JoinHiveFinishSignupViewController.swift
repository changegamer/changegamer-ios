//
//  JoinHiveFinishSignupViewController.swift
//  changegamer
//
//  Created by Kenan Pulak on 3/7/17.
//  Copyright © 2017 Kenan Pulak. All rights reserved.
//

import Foundation
import UIKit
import Parse

class JoinHiveFinishSignupViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var window: UIWindow?
    var tableView : UITableView?
    var activeField: UITextField?
    var beeKeeperModel: BeeKeeperModel?
    var honeyBeeModel: HoneyBeeModel?
    var beeKeeperType: BeeKeeperType?
    let adminLevels:[String] = ["", HiveRelationship.Father.rawValue, HiveRelationship.Mother.rawValue, HiveRelationship.Babysitter.rawValue, HiveRelationship.Caregiver.rawValue, HiveRelationship.Other.rawValue]
    let relationshipTypes:[String] = ["", "son", "daughter"]

    override func viewDidLoad() {
        
        super.viewDidLoad()
        window = UIWindow(frame: UIScreen.main.bounds)
        
        view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false;
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.isNavigationBarHidden = false
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backButton
        self.navigationItem.title = "Finish Account"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.plain, target: self, action: #selector(nextButtonPressed))
        self.navigationItem.rightBarButtonItem?.isEnabled = false

        
        let typeLabel = UILabel()
        typeLabel.font = graphikMediumWithSize(size: 18)
        
        if beeKeeperModel != nil{
           /* beeKeeperType = beeKeeperModel?.type
            if beeKeeperType != nil{
                switch beeKeeperType {
                case .head:
                    typeLabel.text = "Head Bee Keeper"
                    break;
                case .normal:
                    typeLabel.text = "Bee Keeper"
                }
            }*/
            typeLabel.text = "Bee Keeper"
        }
        else{
            typeLabel.text = "Honey Bee"
        }

        typeLabel.backgroundColor = UIColor.clear
        typeLabel.textAlignment = NSTextAlignment.center
        typeLabel.textColor = UIColor.init(.HiveOrange)
        view.addSubview(typeLabel)
        
        typeLabel.snp.makeConstraints { (make) -> Void in
            make.leadingMargin.equalTo(0)
            make.trailingMargin.equalTo(0)
            make.top.equalTo(156)
            make.height.equalTo(18)
            make.centerX.equalTo(self.view.center.x)
        }
        
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 200), style: UITableViewStyle.grouped)
        tableView?.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "textFieldCell")
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.backgroundColor = UIColor.white
        tableView?.tableHeaderView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: (self.tableView?.bounds.size.width)!, height: 0.01));
        tableView?.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
        view.addSubview(tableView!)
        
        tableView?.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(197)
            make.bottom.equalTo(-100)
            make.leadingMargin.equalTo(0)
            make.trailingMargin.equalTo(0)
            make.centerX.equalTo(self.view.center.x)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View Delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        switch section {
        case 0:
            return 4
        case 1:
            return 3
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:TextFieldTableViewCell = tableView.dequeueReusableCell(withIdentifier: "textFieldCell", for: indexPath as IndexPath) as! TextFieldTableViewCell
        cell.textField.delegate = self
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        var firstName : String?
        var lastName : String?
        var dob : Date?
        var relationship: String?
        var email: String?
        var password: String?
        var confirmPassword: String?
        
        if beeKeeperModel != nil {
            firstName = beeKeeperModel?.firstName
            lastName = beeKeeperModel?.lastName
            dob = beeKeeperModel?.dob
            relationship = beeKeeperModel?.relationship
            email = beeKeeperModel?.email
            password = beeKeeperModel?.password
            confirmPassword = beeKeeperModel?.confirm
        }
        else if honeyBeeModel != nil{
            firstName = honeyBeeModel?.firstName
            lastName = honeyBeeModel?.lastName
            dob = honeyBeeModel?.dob
            relationship = honeyBeeModel?.relationship
            email = honeyBeeModel?.email
            password = honeyBeeModel?.password
            confirmPassword = honeyBeeModel?.confirm
        }
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.titleLabel.text = "First Name"
                cell.textField.tag = 0
                cell.textField.isSecureTextEntry = false;
                cell.textField.text = firstName
                break
            case 1:
                cell.titleLabel.text = "Last Name"
                cell.textField.tag = 1
                cell.textField.isSecureTextEntry = false;
                cell.textField.text = lastName
                break
            case 2:
                cell.titleLabel.text = "DOB"
                cell.textField.tag = 2
                cell.textField.isSecureTextEntry = false;
                cell.textField.text = dob?.birthdayFormat
                break
            case 3:
                cell.titleLabel.text = "Relationship"
                cell.textField.tag = 3
                cell.textField.isSecureTextEntry = false;
                cell.textField.text = relationship
                break
            default:
                break
            }
            break
        case 1:
            switch indexPath.row {
            case 0:
                cell.titleLabel.text = "Email"
                cell.textField.tag = 4
                cell.textField.isSecureTextEntry = false;
                cell.textField.text = email
                break
            case 1:
                cell.titleLabel.text = "Password"
                cell.textField.tag = 5
                cell.textField.isSecureTextEntry = true;
                cell.textField.text = password
                break
            case 2:
                cell.titleLabel.text = "Confirm"
                cell.textField.tag = 6
                cell.textField.isSecureTextEntry = true;
                cell.textField.text = confirmPassword
                break
            default:
                break
            }
            break
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //print("User selected table row \(indexPath.row) and item \(itemsToLoad[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0.01
        case 1:
            return 44.0
        default:
            return 0.01
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0.01
        case 1:
            return 216
        default:
            return 0.01
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return UIView.init(frame: CGRect.init(x: 0, y: 0, width: (self.tableView?.bounds.size.width)!, height: 0.01))
        case 1:
            return UIView.init(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 0.01))
        default:
            return UIView.init(frame: CGRect.init(x: 0, y: 0, width: (self.tableView?.bounds.size.width)!, height: 0.01))
        }
    }
    
    // MARK: - TextField Delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeField = textField
        
        let cell = self.activeField?.superview?.superview as! UITableViewCell;
        
        self.tableView?.scrollToRow(at: (tableView?.indexPath(for: cell))!, at: UITableViewScrollPosition.top, animated: true)
        
        switch textField.tag{
        case 0: break
        case 1: break
        case 2:
            // show date picker
            self.showDatePicker()
            break
        case 3:
            // show relationship picker
            self.showAdminLevelPicker()
            break
        case 4:
            if beeKeeperModel != nil{
                beeKeeperModel?.email = textField.text?.lowercased()
            }
            else if honeyBeeModel != nil{
                honeyBeeModel?.email = textField.text?.lowercased()
            }
            break
        case 5:
            if beeKeeperModel != nil{
                beeKeeperModel?.password = textField.text
            }
            else if honeyBeeModel != nil{
                honeyBeeModel?.password = textField.text
            }
            break
        case 6:
            if beeKeeperModel != nil{
                beeKeeperModel?.confirm = textField.text
            }
            else if honeyBeeModel != nil{
                honeyBeeModel?.confirm = textField.text
            }
            break
        default:
            break;
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField.tag {
        case 0:
            if beeKeeperModel != nil{
            beeKeeperModel?.firstName = textField.text
            }
            else if honeyBeeModel != nil{
                honeyBeeModel?.firstName = textField.text
            }
            break
        case 1:
            if beeKeeperModel != nil{
                beeKeeperModel?.lastName = textField.text
            }
            else if honeyBeeModel != nil{
                honeyBeeModel?.lastName = textField.text
            }
            break
        case 2:
            //beeKeeperModel?.dob = textField.text
            break
        case 3:
            //beeKeeperModel?.relationship = textField.text
            break
        case 4:
            if beeKeeperModel != nil{
                beeKeeperModel?.email = textField.text?.lowercased()
            }
            else if honeyBeeModel != nil{
                honeyBeeModel?.email = textField.text?.lowercased()
            }
            break
        case 5:
            if beeKeeperModel != nil{
                beeKeeperModel?.password = textField.text
            }
            else if honeyBeeModel != nil{
                honeyBeeModel?.password = textField.text
            }
            break
        case 6:
            if beeKeeperModel != nil{
                beeKeeperModel?.confirm = textField.text
            }
            else if honeyBeeModel != nil{
                honeyBeeModel?.confirm = textField.text
            }
        default:
            break
        }
        
        if beeKeeperModel != nil{
            if (beeKeeperModel?.allFieldsEntered())!
            {
                print("All Fields Entered")
                
                self.navigationItem.rightBarButtonItem?.isEnabled = true
                
                if (beeKeeperModel?.passwordsMatch())!
                {
                    print("Passwords Match")
                }
                else
                {
                    print("Passwords Don't Match")
                }
            }
            else
            {
                self.navigationItem.rightBarButtonItem?.isEnabled = false
                
                print("Fields Missing")
            }

        }
        else if honeyBeeModel != nil{
            if (honeyBeeModel?.allFieldsEnteredSignUp())!
            {
                print("All Fields Entered")
                
                self.navigationItem.rightBarButtonItem?.isEnabled = true
                
                if (honeyBeeModel?.passwordsMatch())!
                {
                    print("Passwords Match")
                }
                else
                {
                    print("Passwords Don't Match")
                }
            }
            else
            {
                self.navigationItem.rightBarButtonItem?.isEnabled = false
                
                print("Fields Missing")
            }
        }
        
        self.activeField = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
            self.tableView?.scrollToRow(at: IndexPath(row: 0, section: 0), at: UITableViewScrollPosition.top, animated: true)
        }
        // Do not add a line break
        return false
    }
    
    func nextButtonPressed()
    {
        
        
        if beeKeeperModel != nil{
            HiveCreationService.sharedInstance.createUserAndUpdateUserObject(beeKeeper: beeKeeperModel!, completion: { (userObject, success, error) in
                
                if success == true{
                    let navMainViewController: UINavigationController = UINavigationController(rootViewController: MainViewController())
                    self.navigationController?.present(navMainViewController, animated: true, completion: nil)
                }
                else{
                    
                }
                
            })
        }
        else if honeyBeeModel != nil{
            HiveCreationService.sharedInstance.createUserAndUpdateUserObject(honeyBee: honeyBeeModel!, completion: { (userObject, success, error) in
                
                if success == true{
                    let navMainViewController: UINavigationController = UINavigationController(rootViewController: MainViewController())
                    self.navigationController?.present(navMainViewController, animated: true, completion: nil)
                }
                else{
                    
                }
            })
        }
    }
    
    // MARK: - Date Picker Delegate
    
    func showDatePicker()
    {
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.date
        
        self.activeField?.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(CreateBeeKeeperViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        
        self.activeField?.text = sender.date.birthdayFormat
        
        if beeKeeperModel != nil{
            beeKeeperModel?.dob = sender.date
        }
        else if honeyBeeModel != nil{
            honeyBeeModel?.dob = sender.date
        }
        
    }
    
    // MARK: - UIPickerView Delegate
    
    func showAdminLevelPicker()
    {
        let pickerView = UIPickerView()
        
        pickerView.delegate = self
        self.activeField?.inputView = pickerView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if beeKeeperModel != nil{
            self.activeField?.text = adminLevels[row]
            beeKeeperModel?.relationship = adminLevels[row]
        }
        else if honeyBeeModel != nil{
            self.activeField?.text = relationshipTypes[row]
            honeyBeeModel?.relationship = relationshipTypes[row]
        }
    }
    
    // MARK: - UIPickerView Data Source
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if beeKeeperModel != nil{
            return adminLevels.count
        }
        else if honeyBeeModel != nil{
            return relationshipTypes.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if beeKeeperModel != nil{
            return adminLevels[row]
        }
        else if honeyBeeModel != nil{
            return relationshipTypes[row]
        }
        
        return ""
    }
}
