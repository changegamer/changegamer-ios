//
//  ViewController.swift
//  changegamer
//
//  Created by Kenan Pulak on 10/14/16.
//  Copyright © 2016 Kenan Pulak. All rights reserved.
//

import UIKit
import SnapKit
import pop

class MainViewController: UIViewController {

    var window: UIWindow?

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
        self.navigationItem.title = "hive"
        
        let menuButton = UIBarButtonItem(image: #imageLiteral(resourceName: "menu-icon"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(menuButtonPressed))
        self.navigationItem.leftBarButtonItem = menuButton;
        
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), style: UITableViewStyle.plain)
        self.view.addSubview(tableView)
    }
    
    func menuButtonPressed()
    {
        print("menu Button Pressed")
        NotificationCenter.default.post(name: Notification.Name("kLogoutNotification"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

