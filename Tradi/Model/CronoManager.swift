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
    var timer = Timer()
   
    let secondsPerMinute = 60
    let totalTime : Int = 10
    var lastTime : Int = 1
    
    var minuteText = "00"
    var secondText = "01"
    var endPoint : CGFloat = 0
    
    func start(numTag : Int){
        
        if numTag == 0{
            timer.invalidate()
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        } else{
            timer.invalidate()
            minuteText = "00"
            secondText = "00"
            endPoint = 0
            lastTime = 1
        }
    }
    
   
    @objc func updateCounter() {
        
        var minutes : Int = 0
        var seconds : Int = 0
        progress()
        //example functionality
        if  lastTime != totalTime {
            
            if lastTime % secondsPerMinute == 0{
                minutes = lastTime / secondsPerMinute
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
                
            }else{
                timer.invalidate()
                endPoint = 1
                minuteText = "00"
                secondText = "00"
                lastTime = 1
            }
            
        let cronoModel = CronoModel(endPoint: endPoint, minutesString: minuteText, secondsString: secondText)
            self.delegate?.didUpdateCrono(self, cronoModel: cronoModel)
        
    }
    
    func progress(){
        
            let  percent = Float(lastTime) / Float(totalTime)
            endPoint = CGFloat(percent)
        
    }
    
  
}
