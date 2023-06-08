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
    
    func startCronoMotion(){
       
        motionManager.delegate = self
        timer.invalidate()
        lastTime  = 1
        minuteText = "00"
        secondText = "00"
        endPoint  = 0
        
        
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCronoMotion), userInfo: nil, repeats: true)
            
    }
    
    @objc func updateCronoMotion (){
        print(self.lastTime)
        if lastTime == 1{
            motionManager.startMotion()
            startCrono()
        }else if lastTime != totalTime, motionModel.data.condition == false{
            motionManager.startMotion()
            startCrono()
            
        }else if lastTime != totalTime, motionModel.data.condition == true {
           
                self.stopCronoMotion()
               
            print(totalTime)
            
            
           
        }else if lastTime == totalTime{

           stopCronoMotion()
            
        }
        
        self.delegated?.didUpdate(self, response: cronoModel)
        
    }
    
    func stopCronoMotion(){
        timer.invalidate()
        motionManager.stopMotion()
        stopCrono()
    }
}


//MARK: -  Extension MotionManagerDelegate
extension CronoMotionManager : MotionManagerDelegate{
    
    func didUpdateMotion(_ motionManager: MotionManager, motion: MotionModel) {
        DispatchQueue.main.async {
            
            self.motionModel = motion
           
            print(self.motionModel.data.row)
            
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}







