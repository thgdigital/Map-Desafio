//
//  WheaterInteractorBuilder.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation

class WeaterInteractorBuilder {
    
    static func make(metric: Units) -> WeaterInteractor {
        
        let manager = WeaterManager.shared
        
        let locationManager = LocationManager.shared
        
        let interactor = WeaterInteractor(manager: manager, locationManager: locationManager, metric: metric)
        
        manager.output = interactor
        
        locationManager.output = interactor
        
        return interactor
    }
}
