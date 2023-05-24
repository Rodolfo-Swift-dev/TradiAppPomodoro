//
//  ViewController.swift
//  Tradi
//
//  Created by rodoolfo gonzalez on 11-04-23.
//

import UIKit
import Lottie


class InitialViewController : UIViewController{
    
    
    
    @IBOutlet weak var animationView: LottieAnimationView!
    
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


