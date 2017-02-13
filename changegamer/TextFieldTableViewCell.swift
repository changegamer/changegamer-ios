//
//  TextFieldTableViewCell.swift
//  changegamer
//
//  Created by Kenan Pulak on 2/4/17.
//  Copyright © 2017 Kenan Pulak. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import pop

class TextFieldTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let textField = UITextField()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        //super.init(style: UITableViewCellStyle, reuseIdentifier: String?)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel.textColor = UIColor.init(.HiveBlack)
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(textField)
        
        let viewsDict = [
            "titleLabel" : titleLabel,
            "textField" : textField
            ] as [String : Any]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[titleLabel]|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[textField]|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(20)-[titleLabel(100)]-[textField]-|", options: [], metrics: nil, views: viewsDict))
    }
    
    
}

