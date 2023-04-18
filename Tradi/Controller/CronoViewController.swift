//
//  CronoViewController.swift
//  Tradi
//
//  Created by rodoolfo gonzalez on 14-04-23.
//

import UIKit
import HGCircularSlider



class CronoViewController: UIViewController {

   
    @IBOutlet weak var circularView: CircularSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        circularView.minimumValue = 0.0
        circularView.maximumValue = 1.0
        circularView.endPointValue = 0.2
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
