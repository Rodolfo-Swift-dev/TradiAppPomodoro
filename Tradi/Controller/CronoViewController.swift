//
//  CronoViewController.swift
//  Tradi
//
//  Created by rodoolfo gonzalez on 14-04-23.
//

import UIKit
import HGCircularSlider
import CoreMotion



class CronoViewController: UIViewController {

    var motionManager = MotionManager()
    var pitchValue : Double = 0.0
    var yawValue : Double = 0.0
    var rollValue : Double = 0.0
    
    var minutes : Int = 0
    
    var seconds : Int = 0
    var totalTime : Int = 0
    let secondsPerMinute = 60
    var timer = Timer()
    var lastTime : Int = 0
    
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var circularView: CircularSlider!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppUtility.lockOrinetation(.portrait)
        motionManager.proob()
        print(self.pitchValue)
        print(self.yawValue)
        print(self.rollValue)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        motionManager.delegate = self
        circularView.minimumValue = 0.0
        circularView.maximumValue = 1.0
        circularView.endPointValue = 0.2
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AppUtility.lockOrinetation(.all)
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

extension CronoViewController : MotionManagerDelegate{
    
    func didUpdateMotion(_ motionManager: MotionManager, motion: MotionModel) {
        
        DispatchQueue.main.async {
            self.pitchValue = motion.data.pitch
            self.yawValue = motion.data.yaw
            self.rollValue = motion.data.row
            print(self.pitchValue)
            print(self.yawValue)
            print(self.rollValue)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}

