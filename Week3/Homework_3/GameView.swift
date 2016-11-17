//
//  ViewController.swift
//  Homework_3
//
//  Created by Viraj Shah on 9/22/16.
//  Copyright © 2016 Windowed System Programming. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var coordinatesArray = [Coordinate()]
        
    let imagefilterContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageContainer: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "sadpepe")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    
    
    let coordinateContainer: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = UIColor.white
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.isEditable = false
        tv.font = UIFont.systemFont(ofSize: 16)

        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        view.backgroundColor = UIColor.red
        setupNavBarAttributes()
    }
    


    
}

