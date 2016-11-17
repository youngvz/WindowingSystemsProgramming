//
//  PickerController.swift
//  Homework2
//
//  Created by Viraj Shah on 9/14/16.
//  Copyright © 2016 Windowed System Programming. All rights reserved.
//

import UIKit

extension GameViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in colorPicker: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        
        if pickerView == menuPicker{
            
        return menuPickerData.count
            
        }else{
            
        return rangePickerData.count
        
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if pickerView == menuPicker{
            
            return menuPickerData[row]
            
        }else{
            
            return rangePickerData[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func randRange (_ lower: Int , upper: Int) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
    
    func rangeSelected(_ row: Int) -> Void {
        
        counter = 0
        enterText.text = "You tried 0 times"
        
        
        guessTextField.isEnabled = true
        
        if row == 0 {
            
            rangeTextField.text = "10"
            x = randRange(1, upper: 10)

        }else if row == 1 {
            rangeTextField.text = "100"
            x = randRange(1, upper: 100)

        } else if row == 2{
            rangeTextField.text = "1000"
            x = randRange(1, upper: 1000)

        }
        
        
    }
    func hideMenu(){
        menuPicker.removeFromSuperview()
    }
    
    func menuSelected(_ row: Int) -> Void {
        
        if row == 0 {
            reset()
            hideMenu()
        }else if row == 1{
            exit(0)
        }
        
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        if pickerView == menuPicker{
            
            menuSelected(row)
        
        }else{
            
            rangeSelected(row)
        }
        
            
    
        
        
        
    }
    
}

