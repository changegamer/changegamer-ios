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
import Parse

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
        PFUser.logOut()
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionReveal
        transition.subtype = kCATransitionFromRight
        self.view.window!.layer.add(transition, forKey: kCATransition)
        let navInitialViewController: UINavigationController = UINavigationController(rootViewController: InitialViewController())
        self.navigationController?.present(navInitialViewController, animated: false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

