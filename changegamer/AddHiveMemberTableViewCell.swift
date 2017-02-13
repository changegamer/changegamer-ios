//
//  AddHiveTableViewCell.swift
//  changegamer
//
//  Created by Kenan Pulak on 2/12/17.
//  Copyright © 2017 Kenan Pulak. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import pop

class AddHiveMemberTableViewCell: UITableViewCell {
    
    let addImageView = UIImageView()
    let titleLabel = UILabel()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        //super.init(style: UITableViewCellStyle, reuseIdentifier: String?)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addImageView.image = #imageLiteral(resourceName: "add-hive-member")
        addImageView.contentMode = UIViewContentMode.scaleAspectFit
        titleLabel.textColor = UIColor.init(.HiveOrange)
        titleLabel.font = graphikMediumWithSize(size: 16)
        titleLabel.textAlignment = NSTextAlignment.center
        
        addImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(addImageView)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            addImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            addImageView.heightAnchor.constraint(equalToConstant: 47),
            addImageView.widthAnchor.constraint(equalToConstant: 47),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            addImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: addImageView.bottomAnchor, constant: 8),
            ])
    }
}
