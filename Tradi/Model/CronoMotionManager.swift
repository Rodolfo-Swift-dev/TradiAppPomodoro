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

class CronoMotionManager  {
    
    var delegate : CronoMotionManagerDelegate?
    var motionManager = MotionManager()
    var cronoManager = CronoManager()
    var motionModel = MotionModel(data : Data(pitch: 0.0, yaw: 0.0, row: 0.0))
    var cronoModel = CronoModel(endPoint: 0, minutesString: "00", secondsString: "01")
    
    var timer = Timer()

    func startCrono(){
        
        cronoManager.delegate = self
        motionManager.delegate = self
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCronoMotion), userInfo: nil, repeats: true)
    }
    
    @objc func updateCronoMotion (){
        cronoManager.start(numTag: 0)
        motionManager.proob()
        self.delegate?.didUpdate(self, response: cronoModel)
        
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


//MARK: -  Extension CronoManagerDelegate
extension CronoMotionManager : CronoManagerDelegate{
    func didUpdateCrono(_ cronoManager: CronoManager, cronoModel: CronoModel) {
       
        DispatchQueue.main.async {
            self.cronoModel = cronoModel
            
            print(self.cronoModel.secondsString)
        }
    }  
}



