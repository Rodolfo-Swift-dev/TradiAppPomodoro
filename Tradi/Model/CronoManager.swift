//
//  CronoManager.swift
//  Tradi
//
//  Created by rodoolfo gonzalez on 24-05-23.
//

import Foundation


protocol CronoManagerDelegate {
    
    func didUpdateCrono(_ cronoManager: CronoManager, cronoModel: CronoModel)
    
}

class CronoManager{
    
    var delegate : CronoManagerDelegate?
    
    var cronoModel = CronoModel(endPoint: 0, minutesString: "00", secondsString: "00")
    let secondsPerMinute = 60
    let totalTime : Int = 10
    var lastTime : Int = 1
    var minuteText = "00"
    var secondText = "00"
    var endPoint : CGFloat = 0
    
    
    func startCrono() {
        
        var minutes : Int = 0
        var seconds : Int = 0
        
        progress()
        
        //example functionality
        
            
            if lastTime + 1 % secondsPerMinute == 0{
                minutes = lastTime  / secondsPerMinute
                seconds = 0
                
                if minutes < 10{
                    minuteText = "0\(minutes)"
                }else{
                    minuteText = String(minutes)
                }
                
                
            }else {
                minutes = lastTime / secondsPerMinute
                seconds = lastTime % secondsPerMinute
                if seconds < 10{
                    secondText = "0\(seconds)"
                }else{
                    secondText = String(seconds)
                }
                
                if minutes < 10{
                    minuteText = "0\(minutes)"
                }else{
                    minuteText = String(minutes)
                }
            }
            
            
        lastTime += 1
        cronoModel = CronoModel(endPoint: endPoint, minutesString: minuteText, secondsString: secondText)
        self.delegate?.didUpdateCrono(self, cronoModel: cronoModel)
        
    }
    
    func progress(){
        
        let  percent = Float(lastTime) / Float(totalTime)
        endPoint = CGFloat(percent)
        
    }
    
    func stopCrono(){
        
        var minutes : Int = 0
        var seconds : Int = 0
        seconds = lastTime % secondsPerMinute
        minutes = lastTime / secondsPerMinute
        progress()
        lastTime = 1

       
        
        if seconds < 10{
            secondText = "0\(seconds)"
        }else {
            secondText = "\(seconds)"
        }
        if minutes < 10{
            minuteText = "0\(minutes)"
        }else {
            minuteText = "\(minutes)"
        }
        
        
        cronoModel = CronoModel(endPoint: endPoint, minutesString: minuteText, secondsString: secondText)
        
        
        self.delegate?.didUpdateCrono(self, cronoModel: cronoModel)
        
    }
    
    
}
