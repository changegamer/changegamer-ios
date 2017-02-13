//
//  CreateBeeKeeperViewController.swift
//  changegamer
//
//  Created by Kenan Pulak on 2/4/17.
//  Copyright © 2017 Kenan Pulak. All rights reserved.
//

import UIKit
import SnapKit
import pop

class CreateBeeKeeperViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    public enum BeeKeeperType{
        case head, normal
    }
    
    var window: UIWindow?
    var tableView : UITableView?
    var beeKeeperType : BeeKeeperType?
    var activeField: UITextField?
    var beeKeeperModel: BeeKeeperModel?

    override func viewDidLoad() {
        
        super.viewDidLoad()
        window = UIWindow(frame: UIScreen.main.bounds)
        
        enum BeeKeeperType{
            case head, normal
        }
        
        beeKeeperModel = BeeKeeperModel()
        
        view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false;
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.isNavigationBarHidden = false
        
        //let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        //self.navigationItem.backBarButtonItem = backButton
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backButton
        self.navigationItem.title = "New Member"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.plain, target: self, action: #selector(nextButtonPressed))
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        
        let typeLabel = UILabel()
        typeLabel.font = graphikMediumWithSize(size: 18)
        switch beeKeeperType! {
        case .head:
            typeLabel.text = "Head Bee Keeper"
            break;
        case .normal:
            typeLabel.text = "Bee Keeper"
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
        
        print(HiveCreationService.sharedInstance.hiveModel?.hiveName ?? "no hive name")
        
    }
    
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
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.titleLabel.text = "First Name"
                cell.textField.tag = 0
                cell.textField.isSecureTextEntry = false;
                break
            case 1:
                cell.titleLabel.text = "Last Name"
                cell.textField.tag = 1
                cell.textField.isSecureTextEntry = false;
                break
            case 2:
                cell.titleLabel.text = "DOB"
                cell.textField.tag = 2
                cell.textField.isSecureTextEntry = false;
                break
            case 3:
                cell.titleLabel.text = "Relationship"
                cell.textField.tag = 3
                cell.textField.isSecureTextEntry = false;
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
                break
            case 1:
                cell.titleLabel.text = "Password"
                cell.textField.tag = 5
                cell.textField.isSecureTextEntry = true;
                break
            case 2:
                cell.titleLabel.text = "Confirm"
                cell.textField.tag = 6
                cell.textField.isSecureTextEntry = true;
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
    
    // Mark: - TableViewCell TextField Delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeField = textField
        
        let cell = self.activeField?.superview?.superview as! UITableViewCell;

        self.tableView?.scrollToRow(at: (tableView?.indexPath(for: cell))!, at: UITableViewScrollPosition.top, animated: true)
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField.tag {
        case 0:
            beeKeeperModel?.firstName = textField.text
        case 1:
            beeKeeperModel?.lastName = textField.text
        case 2:
            beeKeeperModel?.dob = textField.text
        case 3:
            beeKeeperModel?.relationship = textField.text
        case 4:
            beeKeeperModel?.email = textField.text
        case 5:
            beeKeeperModel?.password = textField.text
        case 6:
            beeKeeperModel?.confirm = textField.text
        default:
            break;
        }
        
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
    
    func checkIfAllFieldsAreFilled() -> Bool {
        
        
        
        return false
    }
    
    func nextButtonPressed()
    {
        HiveCreationService.sharedInstance.hiveModel?.beeKeepers?.append(beeKeeperModel!)
        
        let addHiveMemberController = AddHiveMembersViewController()
        
        self.navigationController?.pushViewController(addHiveMemberController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
