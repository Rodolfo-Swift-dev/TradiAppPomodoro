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

class InitialViewController : UIViewController{
    
    var motionManager = MotionManager()
    var pitchValue : Double = 0.0
    var yawValue : Double = 0.0
    var rollValue : Double = 0.0
    
    @IBOutlet weak var animationView: LottieAnimationView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppUtility.lockOrinetation(.portrait)
        motionManager.proob()
        print(self.pitchValue)
        print(self.yawValue)
        print(self.rollValue)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AppUtility.lockOrinetation(.all)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        motionManager.delegate = self
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        /*titleLabel.textColor = UIColor(named: "indigo")
         titleLabel.charInterval = 0.15
         titleLabel.text = "Tradi"*/
        
    }
}

extension InitialViewController : MotionManagerDelegate{
    
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

