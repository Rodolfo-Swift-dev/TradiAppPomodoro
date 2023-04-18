//
//  ViewController.swift
//  Tradi
//
//  Created by rodoolfo gonzalez on 11-04-23.
//

import UIKit
import CLTypingLabel
import Lottie
import CoreMotion

class InitialViewController : UIViewController {
    
    let motionManager = CMMotionManager()
    let motionQuehue = OperationQueue()
    
    @IBOutlet weak var animationView: LottieAnimationView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        AppUtility.lockOrinetation(.portrait)
        
        motionManager.startDeviceMotionUpdates(to: motionQuehue) { (data : CMDeviceMotion?, error : Error?) in
            guard let data = data else{
                print("Error: \(error!)")
                return
            }
            let motion : CMAttitude = data.attitude
            self.motionManager.deviceMotionUpdateInterval = 1
            
            DispatchQueue.main.async {
                print("pitch  = \(motion.pitch)")
                print("yaw = \(motion.yaw)")
                print("roll = \(motion.roll)")
            }
            
            
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AppUtility.lockOrinetation(.all)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        /*titleLabel.textColor = UIColor(named: "indigo")
        titleLabel.charInterval = 0.15
        titleLabel.text = "Tradi"*/
        
    }


}

