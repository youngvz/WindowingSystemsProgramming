//
//  Coordinate.swift
//  Homework_3
//
//  Created by Viraj Shah on 9/22/16.
//  Copyright © 2016 Windowed System Programming. All rights reserved.
//

import UIKit

class Coordinate: NSObject {
    
    var xcoordinate: CGFloat?
    var ycoordinate: CGFloat?
    

}

extension CGFloat {
    func format(_ f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}
