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
    init(pitch: Double, yaw: Double, row: Double) {
        self.pitch = pitch
        self.yaw = yaw
        self.row = row
    }
}


