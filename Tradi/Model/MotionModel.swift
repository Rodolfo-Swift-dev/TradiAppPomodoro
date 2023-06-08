//
//  MotionMode.swift
//  Tradi
//
//  Created by rodoolfo gonzalez on 22-04-23.
//

import Foundation

struct MotionModel {
    var data : Data
   
}

struct Data {
    let pitch : Double
    let yaw : Double
    let row : Double
    
    var condition : Bool{
       
        switch abs(row){
        case 2...4:
            return true
        default:
            return false
        }
    }
    init(pitch: Double, yaw: Double, row: Double) {
        self.pitch = pitch
        self.yaw = yaw
        self.row = row
    }
}


