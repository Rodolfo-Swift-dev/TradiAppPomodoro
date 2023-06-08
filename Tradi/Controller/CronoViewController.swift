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

    
    var cronoMotionManager = CronoMotionManager()
    var gyroscopeManager = GyroscopeManager()
    var rotationZ : Double = 0.0
    
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var circularView: CircularSlider!
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        
        cronoMotionManager.delegate = self
        gyroscopeManager.delegate = self
        circularView.minimumValue = 0.0
        circularView.maximumValue = 1.0
        circularView.endPointValue = 0.5
       
    }
}

//MARK: -  Extension CronoMotionManagerDelegate
extension CronoViewController : CronoMotionManagerDelegate {
    
    @IBAction func selectMode(_ sender: UIButton) {
        
        circularView.endPointValue = 0
        minuteLabel.text = "00"
        secondLabel.text = "00"
        cronoMotionManager.startCrono()
      
        
        //gyroscopeManager.startGyroscopeUpdate()
        //gyroscopeManager.stop()
        
    }
    
    func didUpdate(_ cronoMotionManager: CronoMotionManager, response: CronoModel) {
        DispatchQueue.main.async {
            self.minuteLabel.text = response.minutesString
            self.secondLabel.text = response.secondsString
            self.circularView.endPointValue = response.endPoint
            
        }
    }
    
    func didError(error: Error) {
        print(error)
    }
}

//MARK: - Extension GyroscopeManagerDelegate
extension CronoViewController : GyroscopeManagerDelegate{
    
    func didUpdateGyroscope(_ gyroscopeManager: GyroscopeManager, motion: GyroscopeModel) {
        DispatchQueue.main.async {
            
            self.rotationZ = motion.rotationRateZ
            
        }
    }
    
    func failWithError(error: Error) {
        print(error)
    }
    
    
}


