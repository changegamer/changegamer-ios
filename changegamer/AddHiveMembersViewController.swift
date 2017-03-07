//
//  AddHiveMembersViewController.swift
//  changegamer
//
//  Created by Kenan Pulak on 2/12/17.
//  Copyright © 2017 Kenan Pulak. All rights reserved.
//

import UIKit
import SnapKit
import pop

class AddHiveMembersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var window: UIWindow?
    var tableView : UITableView?
    var recentlyInvitedBeeKeeper : BeeKeeperModel?
    var recentlyInvitedHoneyBee : HoneyBeeModel?
    
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
        self.navigationItem.title = (HiveCreationService.sharedInstance.hiveModel?.hiveName)! + " Hive"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.plain, target: self, action: #selector(nextButtonPressed))
        
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 200), style: UITableViewStyle.grouped)
        tableView?.register(HiveMemberAddedTableViewCell.self, forCellReuseIdentifier: "HiveMemberAddedTableViewCell")
        tableView?.register(AddHiveMemberTableViewCell.self, forCellReuseIdentifier: "AddHiveMemberTableViewCell")
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.backgroundColor = UIColor.white
        tableView?.tableHeaderView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: (self.tableView?.bounds.size.width)!, height: 0.01));
        tableView?.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tableView?.separatorStyle = UITableViewCellSeparatorStyle.none
        
        view.addSubview(tableView!)
        
        tableView?.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(88)
            make.bottom.equalTo(0)
            make.leadingMargin.equalTo(0)
            make.trailingMargin.equalTo(0)
            make.centerX.equalTo(self.view.center.x)
        }
        
        print(HiveCreationService.sharedInstance.hiveModel?.hiveName ?? "no hive name")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if self.recentlyInvitedHoneyBee != nil{
            InviteService.inviteHoneyBee(honeyBee: self.recentlyInvitedHoneyBee!, hiveID: (HiveCreationService.sharedInstance.hiveModel?.objectID!)!, completion: { (firstName, inviteCode,success, error) -> Void in
                
                if success == true{
                    self.recentlyInvitedHoneyBee = nil
                    self.recentlyInvitedBeeKeeper = nil

                    let inviteCodeView = InviteCodeView.init()
                    inviteCodeView.headerLabel.text = "Hive Invite Sent!"
                    inviteCodeView.userNameLabel.text = firstName
                    inviteCodeView.subtitleLabel.text = "Enter code on device"
                    inviteCodeView.inviteCodeLabel.text = inviteCode
                    inviteCodeView.expirationLabel.text = "Expires in 48hrs"
                    inviteCodeView.translatesAutoresizingMaskIntoConstraints = false
                    
                    self.view.addSubview(inviteCodeView)
                    
                    NSLayoutConstraint.activate([inviteCodeView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                                 inviteCodeView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70.0),
                                                 inviteCodeView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
                                                 inviteCodeView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
                                                 inviteCodeView.heightAnchor.constraint(equalToConstant: 462)])
                    
                }
                
            })
        }
        
        if self.recentlyInvitedBeeKeeper != nil{
            InviteService.inviteBeeKeeper(beeKeeper: self.recentlyInvitedBeeKeeper!, hiveID: (HiveCreationService.sharedInstance.hiveModel?.objectID!)!, completion: { (firstName, email, inviteCode,success, error) -> Void in
                
                if success == true{
                    self.recentlyInvitedBeeKeeper = nil
                    self.recentlyInvitedHoneyBee = nil
                    
                    

                    let inviteCodeView = InviteCodeView.init(frame: CGRect(x: 20, y: 70, width: self.view.frame.size.width-40, height: 462))
                    inviteCodeView.headerLabel.text = "Hive Invite Sent!"
                    inviteCodeView.userNameLabel.text = firstName
                    inviteCodeView.subtitleLabel.text = email
                    inviteCodeView.inviteCodeLabel.text = inviteCode
                    inviteCodeView.expirationLabel.text = "Expires in 48hrs"
                    
                    self.view.addSubview(inviteCodeView)
                    
                    NSLayoutConstraint.activate([inviteCodeView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                                 inviteCodeView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70.0),
                                                 inviteCodeView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
                                                 inviteCodeView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
                                                 inviteCodeView.heightAnchor.constraint(equalToConstant: 462)])
                    
                }
                
            })
        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        switch section {
        case 0:
            return (HiveCreationService.sharedInstance.hiveModel?.beeKeepers?.count)!
        case 1:
            return 1
        case 2:
            return (HiveCreationService.sharedInstance.hiveModel?.honeyBees?.count)!
        case 3:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {

        switch indexPath.section {
        case 0:
            let hiveMemberAddedCell:HiveMemberAddedTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HiveMemberAddedTableViewCell", for: indexPath as IndexPath) as! HiveMemberAddedTableViewCell
            hiveMemberAddedCell.selectionStyle = UITableViewCellSelectionStyle.none
            let beeKeeper = (HiveCreationService.sharedInstance.hiveModel?.beeKeepers?[indexPath.row])! as BeeKeeperModel
            hiveMemberAddedCell.titleLabel.text = beeKeeper.firstName
            switch beeKeeper.type! {
            case .head:
                hiveMemberAddedCell.subTitleLabel.text = "Head Bee Keeper"
                break
            case .normal:
                hiveMemberAddedCell.subTitleLabel.text = "Bee Keeper"
                break
            }
            return hiveMemberAddedCell
        case 1:
            let addHiveMemberTableViewCell:AddHiveMemberTableViewCell = tableView.dequeueReusableCell(withIdentifier: "AddHiveMemberTableViewCell", for: indexPath as IndexPath) as! AddHiveMemberTableViewCell
            addHiveMemberTableViewCell.selectionStyle = UITableViewCellSelectionStyle.none
            addHiveMemberTableViewCell.titleLabel.text = "Add Bee Keeper"
            return addHiveMemberTableViewCell
        case 2:
            let hiveMemberAddedCell:HiveMemberAddedTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HiveMemberAddedTableViewCell", for: indexPath as IndexPath) as! HiveMemberAddedTableViewCell
            hiveMemberAddedCell.selectionStyle = UITableViewCellSelectionStyle.none
            let honeyBeeModel = (HiveCreationService.sharedInstance.hiveModel?.honeyBees?[indexPath.row])! as HoneyBeeModel
            hiveMemberAddedCell.titleLabel.text = honeyBeeModel.firstName
            hiveMemberAddedCell.subTitleLabel.text = "Honey Bee"
            return hiveMemberAddedCell
        case 3:
            let addHiveMemberTableViewCell:AddHiveMemberTableViewCell = tableView.dequeueReusableCell(withIdentifier: "AddHiveMemberTableViewCell", for: indexPath as IndexPath) as! AddHiveMemberTableViewCell
            addHiveMemberTableViewCell.selectionStyle = UITableViewCellSelectionStyle.none
            addHiveMemberTableViewCell.titleLabel.text = "Add Honey Bee"
            return addHiveMemberTableViewCell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        switch indexPath.section {
        case 0:
            break;
        case 1:
            self.createNewBeeKeeper()
        case 2:
            break;
        case 3:
            self.createNewHoneyBee()
        default:
            break;
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0.01
        case 1:
            return 0.01
        default:
            return 0.01
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0.01
        case 1:
            return 0.01
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
    
    func createNewBeeKeeper()
    {
        let createBeeKeeperViewController = CreateBeeKeeperViewController()
        createBeeKeeperViewController.beeKeeperType = .normal
        
        self.navigationController?.pushViewController(createBeeKeeperViewController, animated: true)
    }
    
    func createNewHoneyBee()
    {
        //temporarily show WIP AlertView
        /*
        let alertController = UIAlertController(title: "WIP", message: "Adding a Honey Bee is still in progress", preferredStyle: UIAlertControllerStyle.alert)
        
        // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
            print("OK")
        }
        
        // alertController.addAction(DestructiveAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        */
        
        let createHoneyBeeViewController = CreateHoneyBeeViewController()
        self.navigationController?.pushViewController(createHoneyBeeViewController, animated: true)
    }
    
    func nextButtonPressed()
    {
        let navMainViewController: UINavigationController = UINavigationController(rootViewController: MainViewController())
        self.navigationController?.present(navMainViewController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
