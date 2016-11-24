//
//  MenuCell.swift
//  Homework 4
//
//  Created by Viraj Shah on 10/11/16.
//  Copyright © 2016 WSP. All rights reserved.
//

import UIKit

class MenuCell: BaseCell {
    
    let resetLabel: UILabel = {
        let label = UILabel()
        label.text = "Reset Game"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func setupViews() {
        super.setupViews()
        addSubview(resetLabel)
        
        resetLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
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
