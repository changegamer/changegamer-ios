//
//  InviteCodeView.swift
//  changegamer
//
//  Created by Kenan Pulak on 3/5/17.
//  Copyright © 2017 Kenan Pulak. All rights reserved.
//

import Foundation
import UIKit

class InviteCodeView: UIView {
    
    let headerLabel = UILabel()
    let imageView = UIImageView()
    let userNameLabel = UILabel()
    let subtitleLabel = UILabel()
    let inviteCodeLabel = UILabel()
    let expirationLabel = UILabel()
    let okButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initializeView()
    }
    
    init() {
        super.init(frame: CGRect.zero)
        self.initializeView()
    }
    
    func initializeView(){
        self.backgroundColor = UIColor.white
        self.layer.borderColor = UIColor.init(.HiveBlack).cgColor
        self.layer.borderWidth = 1
        
        self.headerLabel.numberOfLines = 1
        self.headerLabel.font = graphikMediumWithSize(size: 28)
        self.headerLabel.textColor = UIColor.init(.HiveOrange)
        self.headerLabel.textAlignment = .center
        self.headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.imageView.backgroundColor = UIColor.init(.HiveOrange)
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.userNameLabel.numberOfLines = 1
        self.userNameLabel.font = graphikMediumWithSize(size: 18)
        self.userNameLabel.textColor = UIColor.init(.HiveOrange)
        self.userNameLabel.textAlignment = .center
        self.userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.subtitleLabel.numberOfLines = 1
        self.subtitleLabel.font = graphikLightWithSize(size: 14)
        self.subtitleLabel.textColor = UIColor.init(.HiveBlack)
        self.subtitleLabel.textAlignment = .center
        self.subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.inviteCodeLabel.numberOfLines = 1
        self.inviteCodeLabel.font = graphikMediumWithSize(size: 28)
        self.inviteCodeLabel.textColor = UIColor.init(.HiveOrange)
        self.inviteCodeLabel.textAlignment = .center
        self.inviteCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.expirationLabel.numberOfLines = 1
        self.expirationLabel.font = graphikLightWithSize(size: 14)
        self.expirationLabel.textColor = UIColor.init(.HiveBlack)
        self.expirationLabel.textAlignment = .center
        self.expirationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let font = graphikMediumWithSize(size: 18)
        let okColor = UIColor.init(.HiveOrange)
        let attributedString = NSAttributedString(string: "OK", attributes: [NSFontAttributeName:font, NSForegroundColorAttributeName:okColor])
        
        //self.okButton.frame = CGRect.init(x: 0, y: 0, width: 44, height: 44)
        self.okButton.setAttributedTitle(attributedString, for: UIControlState.normal)
        self.okButton.addTarget(self, action: #selector(okButtonPressed), for: UIControlEvents.touchUpInside)
        //self.okButton.backgroundColor = UIColor.red
        self.okButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(self.headerLabel)
        self.addSubview(self.imageView)
        self.addSubview(self.userNameLabel)
        self.addSubview(self.subtitleLabel)
        self.addSubview(self.inviteCodeLabel)
        self.addSubview(self.expirationLabel)
        self.addSubview(self.okButton)
        
        NSLayoutConstraint.activate([self.headerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     self.headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 60.0),
                                     self.headerLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15.0),
                                     self.headerLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15.0),
                                     self.headerLabel.heightAnchor.constraint(equalToConstant: 28.0),
                                     self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     self.imageView.topAnchor.constraint(equalTo: self.headerLabel.bottomAnchor, constant: 40.0),
                                     self.imageView.widthAnchor.constraint(equalToConstant: 70.0),
                                     self.imageView.heightAnchor.constraint(equalToConstant: 70.0),
                                     self.userNameLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 20),
                                     self.userNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
                                     self.userNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
                                     self.userNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     self.userNameLabel.heightAnchor.constraint(equalToConstant: 18),
                                     self.subtitleLabel.topAnchor.constraint(equalTo: self.userNameLabel.bottomAnchor, constant: 10),
                                     self.subtitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
                                     self.subtitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
                                     self.subtitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     self.subtitleLabel.heightAnchor.constraint(equalToConstant: 14),
                                     self.inviteCodeLabel.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: 60),
                                     self.inviteCodeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
                                     self.inviteCodeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
                                     self.inviteCodeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     self.inviteCodeLabel.heightAnchor.constraint(equalToConstant: 28),
                                     self.expirationLabel.topAnchor.constraint(equalTo: self.inviteCodeLabel.bottomAnchor, constant: 10),
                                     self.expirationLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
                                     self.expirationLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
                                     self.expirationLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     self.expirationLabel.heightAnchor.constraint(equalToConstant: 14),
                                     self.okButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
                                     self.okButton.heightAnchor.constraint(equalToConstant: 44),
                                     self.okButton.widthAnchor.constraint(equalToConstant: 44),
                                     self.okButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)
            ])

    }
    
    func okButtonPressed(){
        self.removeFromSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

