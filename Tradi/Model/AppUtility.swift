//
//  AppUtility.swift
//  Tradi
//
//  Created by rodoolfo gonzalez on 17-04-23.
//

import UIKit

struct AppUtility{
    static func lockOrinetation(_ orientation : UIInterfaceOrientationMask){
        if let delegate = UIApplication.shared.delegate as? AppDelegate{
            delegate.orientationLock = orientation
        }
    }
   
}
