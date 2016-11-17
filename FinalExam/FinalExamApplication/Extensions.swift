//
//  Extensions.swift
//  FinalExamApplication
//
//  Created by Viraj Shah on 11/17/16.
//  Copyright © 2016 VetekConsutling. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func checkTextField(_ text: String) -> Bool {
        if text.isEmpty == true{
            return true
        }
        return false
    }
}

extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}

