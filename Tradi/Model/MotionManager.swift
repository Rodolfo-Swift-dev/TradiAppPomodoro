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
    
    func proob() {
        
        motionManager.startDeviceMotionUpdates ( to: motionQuehue ) { (data :  CMDeviceMotion?, error : Error?) in
            guard let data = data else{
                print("Error: \(error!)")
                self.delegate?.didFailWithError(error: error!)
                return
            }
            
            let motionModel = MotionModel(data: Data(pitch: data.attitude.pitch, yaw: data.attitude.yaw, row: data.attitude.roll))
                // Aquí se procesa el motionData o se realiza cualquier otra acción necesaria
            self.motionManager.deviceMotionUpdateInterval = 1
            self.delegate?.didUpdateMotion(self, motion : motionModel)
                
            
        }
    }
    // Detener las actualizaciones después de 3 segundos
    func stop(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.motionManager.stopDeviceMotionUpdates()
        }
    }
    
    
   
}
