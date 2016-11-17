//
//  FunctionController+handlers.swift
//  FinalExamApplication
//
//  Created by Viraj Shah on 11/17/16.
//  Copyright © 2016 VetekConsutling. All rights reserved.
//

import UIKit

extension FunctionController{
    
    func setupNavBar(){
        navigationItem.title = "Exam Programming Assignment"
        
        let menuButton = UIBarButtonItem(image: UIImage(named: "Menu")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(logout))
        
        navigationItem.rightBarButtonItem =  menuButton
    }
    
    func logout(){
        menuLauncher.showSettings()
        
    }
    
    func handleFunction(){
        functionLauncher.showSettings()
    }
    
    func handleButton(){
        
        guard let xLabel = xTextField.text else{
            return
        }
        
        guard let yLabel = yTextField.text else{
            return
        }
        
        if xLabel.isEmpty && yLabel.isEmpty{
            let alert = UIAlertController(title: "Alert", message: "Please enter a X and Y value", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return
            
        }else if xLabel.isEmpty{
            let alert = UIAlertController(title: "Alert", message: "Please enter an X value", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return
        }else if yLabel.isEmpty{
            let alert = UIAlertController(title: "Alert", message: "Please enter an Y value", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return
            
        }
        
        // check if x and y label is valid
        
        let yNum = Double(yLabel)
        let xNum = Double(xLabel)
        
        if (xNum == nil) && (yNum == nil) {
            
            let alert = UIAlertController(title: "Alert", message: "Please, correct errors in X and Y", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return
            
            
        }else if (yNum == nil){
            
            let alert = UIAlertController(title: "Alert", message: "Please, correct errors in Y", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return
        }else if (xNum == nil){
            
            let alert = UIAlertController(title: "Alert", message: "Please, correct errors in X", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        guard let functionName = functionContainerLabel.text else{
            let alert = UIAlertController(title: "Alert", message: "Please select a function to compute!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            
            return
        }
        
        let x = convertString(xLabel)
        let y = convertString(yLabel)
        
        
        if functionName == "3*X+4*Y-8"{
            
            let value = ((3*x)+(4*y)-8)
            computeTextField.text = String(value)
        }
        if functionName == "X/(Y*Y+1)"{
            let value = (x/((y*y)+1))
            computeTextField.text = String(value)
            
        }
        if functionName == "X*X-Y+2" {
            let value = ((x*x) - y + 2)
            computeTextField.text = String(value)
        }
        
    }
    
    func convertString(_ value: String) -> Double {
        
        let converted: Double = Double(value)!
        
        return converted
    }

}
