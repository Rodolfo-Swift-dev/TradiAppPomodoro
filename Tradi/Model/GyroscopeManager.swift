//
//  Gyroscope.swift
//  Tradi
//
//  Created by rodoolfo gonzalez on 06-06-23.
//

import Foundation
import CoreMotion

protocol GyroscopeManagerDelegate {
    func didUpdateGyroscope(_ gyroscopeManager: GyroscopeManager, motion: GyroscopeModel)
    func failWithError(error: Error)
    
}

class GyroscopeManager{
    
    var delegate : GyroscopeManagerDelegate?
    let motionManager = CMMotionManager()
    let motionQuehue = OperationQueue()
    
    //estar pendiente si hay que eliminar el main en el motionquehue
    func startGyroscopeUpdate(){
        if motionManager.isGyroAvailable{
            motionManager.gyroUpdateInterval = 0.1
            motionManager.startGyroUpdates(to: motionQuehue) { data, error in
                guard let rotationRate = data?.rotationRate else {
                    print("Error: \(error!)")
                    self.delegate?.failWithError(error: error!)
                    return
                }
                
                let gyroscopeModel = GyroscopeModel(rotationRateZ: rotationRate.z)
                self.delegate?.didUpdateGyroscope(self, motion: gyroscopeModel)
            }
        }
    }
    
    
    func stop(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.motionManager.stopGyroUpdates()
            print("stop")
        }
    }
    
}
