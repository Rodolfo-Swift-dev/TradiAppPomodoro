//
//  CronoMotionManager.swift
//  Tradi
//
//  Created by rodoolfo gonzalez on 29-05-23.
//

import Foundation

protocol CronoMotionManagerDelegate {
    func didUpdate(_ cronoMotionManager: CronoMotionManager, response: CronoModel)
    func didError( error: Error)
    
}

class CronoMotionManager : CronoManager  {
    
    var delegated : CronoMotionManagerDelegate?
    var motionManager = MotionManager()
    var motionModel = MotionModel(data : Data(pitch: 0.0, yaw: 0.0, row: 0.0))
    var timer = Timer()
    
    func startCrono(){
        
        motionManager.delegate = self
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCronoMotion), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCronoMotion (){
        
        motionManager.proob()
        start()
        print(self.cronoModel.secondsString)
        self.delegated?.didUpdate(self, response: cronoModel)
        
    }
}


//MARK: -  Extension MotionManagerDelegate
extension CronoMotionManager : MotionManagerDelegate{
    
    func didUpdateMotion(_ motionManager: MotionManager, motion: MotionModel) {
        DispatchQueue.main.async {
            
            self.motionModel = motion
            print(self.motionModel.data.pitch)
            print(self.motionModel.data.row)
            print(self.motionModel.data.yaw)
            print("ok")
            
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}







