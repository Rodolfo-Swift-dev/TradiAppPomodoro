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

    var timer = Timer()
    var motionManager = MotionManager()
    var cronoManager = CronoManager()
    var pitchValue : Double = 0.0
    var yawValue : Double = 0.0
    var rollValue : Double = 0.0
    
    
    
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var circularView: CircularSlider!
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        
        
        print(self.pitchValue)
        print(self.yawValue)
        print(self.rollValue)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        cronoManager.delegate = self
        motionManager.delegate = self
        circularView.minimumValue = 0.0
        circularView.maximumValue = 1.0
        circularView.endPointValue = 0.5
        
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
extension CronoViewController : CronoManagerDelegate{
    
    @IBAction func selectMode(_ sender: UIButton) {
        
        
        circularView.endPointValue = 0
        minuteLabel.text = "00"
        secondLabel.text = "00"
        cronoManager.start(numTag: sender.tag)
        motionManager.proob()
        motionManager.stop()
    
       
        
    }
    
    func didUpdateCrono(_ cronoManager: CronoManager, cronoModel: CronoModel) {
      
        DispatchQueue.main.async {
            self.minuteLabel.text = cronoModel.minutesString
            self.secondLabel.text = cronoModel.secondsString
            self.circularView.endPointValue = cronoModel.endPoint
        }
    }
}

