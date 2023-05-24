//
//  MotionDevices.swift
//  Tradi
//
//  Created by rodoolfo gonzalez on 21-04-23.
//

import Foundation
import CoreMotion

protocol MotionManagerDelegate {
    func didUpdateMotion(_ motionManager: MotionManager, motion: MotionModel)
    func didFailWithError( error: Error)
    
}
class MotionManager{
    
    var delegate : MotionManagerDelegate?
    let motionManager = CMMotionManager()
    let motionQuehue = OperationQueue()
    
    
    func proob(){
        motionManager.startDeviceMotionUpdates ( to: motionQuehue ) { (data :  CMDeviceMotion?, error : Error?) in
            guard let data = data else{
                print("Error: \(error!)")
                self.delegate?.didFailWithError(error: error!)
                return
            }
            let motionData = data
            let motionModel = MotionModel(data: Data(pitch: motionData.attitude.pitch, yaw: motionData.attitude.yaw, row: motionData.attitude.roll))
            self.motionManager.deviceMotionUpdateInterval = 0.5
            self.delegate?.didUpdateMotion(self, motion : motionModel)
            
        }
    }
  
}
