//
//  MenuCell.swift
//  Homework 4
//
//  Created by Viraj Shah on 10/11/16.
//  Copyright © 2016 WSP. All rights reserved.
//

import UIKit

class MenuCell: BaseCell {
    
    
    let iconImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "signout")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor(red:0.60, green:0.60, blue:0.60, alpha:1.00)

        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let resetLabel: UILabel = {
        let label = UILabel()
        label.text = "Reset Game"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(iconImage)
        addSubview(resetLabel)

        
        iconImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        iconImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        iconImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        resetLabel.leftAnchor.constraint(equalTo: iconImage.rightAnchor, constant: 12).isActive = true
        resetLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        resetLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        resetLabel.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
    
    
}

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
