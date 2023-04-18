//
//  CronoViewController.swift
//  Tradi
//
//  Created by rodoolfo gonzalez on 14-04-23.
//

import UIKit
import HGCircularSlider



class CronoViewController: UIViewController {

    var minutes : Int = 0
    var seconds : Int = 0
    var totalTime : Int = 0
    let secondsPerMinute = 60
    var timer = Timer()
    var lastTime : Int = 0
    
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var circularView: CircularSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        circularView.minimumValue = 0.0
        circularView.maximumValue = 1.0
        circularView.endPointValue = 0.2
        
    }
    
    
    @IBAction func selectMode(_ sender: UIButton) {
        timer.invalidate()
        circularView.endPointValue = 0
        seconds = 0
        minutes = 0
        lastTime = 1
        minuteLabel.text = "00"
        secondLabel.text = "00"
        
        if sender.tag == 0{
           
            totalTime = 3 * secondsPerMinute
        }else{
            
            totalTime = 6 * secondsPerMinute
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCounter() {
        progress()
        //example functionality
        if  lastTime != totalTime {
            
            if lastTime % secondsPerMinute == 0{
                minutes = lastTime / secondsPerMinute
                seconds = 0
                if seconds < 10{
                    secondLabel.text = "0\(seconds)"
                }else{
                    secondLabel.text = String(seconds)
                }
                if minutes < 10{
                    minuteLabel.text = "0\(minutes)"
                }else{
                    minuteLabel.text = String(minutes)
                }
                
                
            }else {
                minutes = lastTime / secondsPerMinute
                seconds = lastTime % secondsPerMinute
                if seconds < 10{
                    secondLabel.text = "0\(seconds)"
                }else{
                    secondLabel.text = String(seconds)
                }
                if minutes < 10{
                    minuteLabel.text = "0\(minutes)"
                }else{
                    minuteLabel.text = String(minutes)
                }
               
            }
            lastTime += 1
        }else{
            timer.invalidate()
            circularView.endPointValue = 1
            minuteLabel.text = "00"
            secondLabel.text = "00"
            lastTime = 0
        }
        
            
        
    }
    func progress(){
        
            let  percent = Float(lastTime) / Float(totalTime)
        circularView.endPointValue = CGFloat(percent)
        
        
        
    }
    

}
