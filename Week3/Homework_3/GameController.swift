//
//  GameController.swift
//  Homework_3
//
//  Created by Viraj Shah on 9/23/16.
//  Copyright © 2016 Windowed System Programming. All rights reserved.
//

import UIKit

extension GameViewController{
    
    func setupNavBarAttributes(){
        navigationItem.title = "Mouse Tracker"
        
        let addButton = UIBarButtonItem(image: UIImage(named: "Menu"), style: .plain, target: self, action: #selector(menuTapped))
        addButton.tintColor = UIColor.gray
        navigationItem.rightBarButtonItem = addButton
        
        navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "AmericanTypewriter", size: 24)!, NSForegroundColorAttributeName : UIColor.darkGray]
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.white
        
    }
    
    func menuTapped(){
        coordinateContainer.text = ""
        for view in imagefilterContainer.subviews{
            view.removeFromSuperview()
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position :CGPoint = touch.location(in: imageContainer)
            let location = (touch).location(in: self.imageContainer)
            let dot = UIView(frame: CGRect(x: location.x, y: location.y, width: 3, height: 3))
            dot.backgroundColor = UIColor.black
            self.imagefilterContainer.addSubview(dot) //add dot as subview to your main view
            
            
            let coordinate = Coordinate()
            coordinate.xcoordinate = position.x
            coordinate.ycoordinate = position.y
            addCoordinate(coordinate)
        }
    }
    
    func addCoordinate(_ coordinate: Coordinate) -> Void {
        
        var coordinateString = ""
        
        if let x = (coordinate.xcoordinate?.format(".2") ){
                coordinateString = "(\(x), "
        }
        if let y = (coordinate.ycoordinate?.format(".2")){
                coordinateString += "\(y))"
        }
        
//        if let x = (coordinate.xcoordinate)?.description {
//            coordinateString = "(\(x),"
//        }
//        if let y = (coordinate.ycoordinate)?.description {
//            coordinateString += "\(y))"
//        }
        //Take this string and add it to the UITextView

        coordinateContainer.text = coordinateContainer.text + (coordinateString + " ")
        print(coordinateString)
        
    }

    func setupViews(){
        view.addSubview(imageContainer)
        view.addSubview(imagefilterContainer)
        view.addSubview(coordinateContainer)
        
        imageContainer.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        imageContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
        
        imagefilterContainer.topAnchor.constraint(equalTo: imageContainer.topAnchor).isActive = true
        imagefilterContainer.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor).isActive = true
        imagefilterContainer.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor).isActive = true
        imagefilterContainer.heightAnchor.constraint(equalTo: imageContainer.heightAnchor).isActive = true
        
        coordinateContainer.topAnchor.constraint(equalTo: imageContainer.bottomAnchor).isActive = true
        coordinateContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        coordinateContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        coordinateContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        
    }
    
}
