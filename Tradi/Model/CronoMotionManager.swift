//
//  CronoMotionManager.swift
//  Tradi
//
//  Created by rodoolfo gonzalez on 29-05-23.
//

import Foundation

protocol CronoMotionManagerDelegate {
    func didUpdate(_ cronoMotionManager: CronoMotionManager, response: CronoMotionModel)
    func didError( error: Error)
    
}


class CronoMotionManager {
    var delegate : CronoMotionManagerDelegate?
    var motionManager = MotionManager()
    var cronoManager = CronoManager()
    
    // cronoManager.delegate = self
    // motionManager.delegate = self
    
    
    
}



extension CronoMotionManager : MotionManagerDelegate {
    func didUpdateMotion(_ motionManager: MotionManager, motion: MotionModel) {
        <#code#>
    }
    
    func didFailWithError(error: Error) {
        <#code#>
    }
    
    
    
}


extension CronoMotionManager : CronoManagerDelegate {
    func didUpdateCrono(_ cronoManager: CronoManager, cronoModel: CronoModel) {
        <#code#>
    }
    
    
}

