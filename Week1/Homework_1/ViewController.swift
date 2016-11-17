//
//  ViewController.swift
//  Homework_1
//
//  Created by Viraj Shah on 8/25/16.
//  Copyright © 2016 Windowed System Programming. All rights reserved.

/**
 
 Write a program which has one main window.
 
 1) Add a button to the bottom right corner, button should be for closing window. Change the text on the button to "Close me".
 
 2) Add a label in the middle of the window. Add text on the label "Hello, this is homwork 1 by <first and last name>" where text "<first and last name> is replaced with your first and lasn name.
 
 3) Also put your first and last name in the title of the window.
 
 Your layout doesnt have to be resizable, you can assume window size will be fixed.
 
*/


import UIKit

class ViewController: UIViewController {

    //closure block that declares button properties
    lazy var closebtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.redColor()
        //declares button title(label)
        btn.setTitle("Close Me", forState: .Normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        //method for handling button Tap
        btn.addTarget(self, action: #selector(handleCloseApp), forControlEvents: .TouchUpInside)
        btn.titleLabel?.font = UIFont(name: "AmericanTypewriter", size: 22)
        return btn
    }()
    
    //closure block that declares label properties
    let namelabel: UILabel = {
        let label = UILabel()
        //declares label text
        label.text = "Hello, this is Homework 1 by Viraj Shah"
        label.numberOfLines = 0
        label.textAlignment = .Center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.blackColor()
        label.font = UIFont(name: "AmericanTypewriter", size: 20)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sets background color
        view.backgroundColor = UIColor.whiteColor()
        
        //setups up views
        setupNavBarAttributes()
        setupViews()
        
    }
    
    func setupNavBarAttributes(){
        // Put your first and last name in the title of the window.
        navigationItem.title = "Viraj Shah"
        
        navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AmericanTypewriter", size: 24)!, NSForegroundColorAttributeName : UIColor.whiteColor()]
        navigationController?.navigationBar.translucent = false
        navigationController?.navigationBar.barTintColor = UIColor.redColor()
        
    }

    func handleCloseApp(){
        //Method handler for button Tap
        //animation code for button when tapped
        closebtn.transform = CGAffineTransformMakeScale(0.6, 0.6)
        UIView.animateWithDuration(1.0,
                                   delay: 0,
                                   usingSpringWithDamping: 0.9,
                                   initialSpringVelocity: 0.5,
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.closebtn.transform = CGAffineTransformIdentity
            }, completion:  {
                (value: Bool) in
                    //exit application
                    exit(0)
        })
        
    }
    
    func setupViews(){
        //Adds button to the view hierarchy
        view.addSubview(closebtn)
        //Adds label to the view hierarchy
        view.addSubview(namelabel)
        
        
        //Pin button to the bottom of the view
        closebtn.bottomAnchor.constraintEqualToAnchor(bottomLayoutGuide.topAnchor).active = true
        //Pin button to the leading anchor (right side)
        closebtn.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor).active = true
        //Pin button to the trailing anchor (left side)
        closebtn.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor).active = true
        //Define the height of button relative to the view's height
        closebtn.heightAnchor.constraintEqualToAnchor(view.heightAnchor, multiplier: 0.10).active = true
        
        //Pin label to the center X coordinate of the view
        namelabel.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        //Pin label to the center Y coordinate of the view
        namelabel.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
        //Define the width of the label
        namelabel.widthAnchor.constraintEqualToAnchor(view.widthAnchor).active = true
        //Define the height of the label relative to hte view's height
        namelabel.heightAnchor.constraintEqualToAnchor(view.heightAnchor, multiplier: 0.10).active = true
        
        
        
    }
}

