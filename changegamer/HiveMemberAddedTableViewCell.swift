//
//  HiveMemberAddedTableViewCell.swift
//  changegamer
//
//  Created by Kenan Pulak on 2/12/17.
//  Copyright © 2017 Kenan Pulak. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import pop

class HiveMemberAddedTableViewCell: UITableViewCell {
    
    let userImageView = UIImageView()
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        //super.init(style: UITableViewCellStyle, reuseIdentifier: String?)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        userImageView.backgroundColor = UIColor.init(.HiveOrange)
        titleLabel.textColor = UIColor.init(.HiveOrange)
        subTitleLabel.textColor = UIColor.init(.HiveBlack)
        
        titleLabel.textAlignment = NSTextAlignment.center
        subTitleLabel.textAlignment = NSTextAlignment.center
        
        titleLabel.font = graphikMediumWithSize(size: 24)
        subTitleLabel.font = graphikLightWithSize(size: 14)
        
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(userImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        
        NSLayoutConstraint.activate([
            userImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            subTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            userImageView.heightAnchor.constraint(equalToConstant: 71),
            userImageView.widthAnchor.constraint(equalToConstant: 71),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            subTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            subTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            userImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 8),
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8)
            ])
    }
}
