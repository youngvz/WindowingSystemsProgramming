//
//  Extensions.swift
//  Homework 4
//
//  Created by Viraj Shah on 10/11/16.
//  Copyright © 2016 WSP. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func systemColor(_ color: String) -> UIColor{
        
        switch (color){
        case "White":
            return .white
        case "Gray":
            return .gray
        case "Black":
            return .black
        case "Yellow":
            return .yellow
        case "Orange":
            return .orange
        case "Red":
            return .red
        case "Green":
            return .green
        case "Blue":
            return .blue
        case "Violet":
            return .purple
        case "Pink":
            return UIColor(red:1.00, green:0.54, blue:0.99, alpha:1.00)
        default:
            return .white
        }
    }
}
