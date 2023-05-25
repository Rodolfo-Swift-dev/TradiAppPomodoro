//
//  CronoModel.swift
//  Tradi
//
//  Created by rodoolfo gonzalez on 24-05-23.
//

import Foundation

struct CronoModel {
    
    let endPoint : CGFloat
    let minutesString : String
    let secondsString : String
    init(endPoint: CGFloat, minutesString: String, secondsString: String) {
        self.endPoint = endPoint
        self.minutesString = minutesString
        self.secondsString = secondsString
    }
}


