//
//  WheaterInteractorBuilder.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation

class WheaterInteractorBuilder {
    
    static func make() -> WheaterInteractor {
        
        let manager = WheaterManager.shared
        
        let locationManager = LocationManager.shared
        
        let interactor = WheaterInteractor(manager: manager, locationManager: locationManager)
        
        manager.output = interactor
        
        locationManager.output = interactor
        
        return interactor
    }
}
