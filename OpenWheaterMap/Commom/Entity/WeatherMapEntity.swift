//
//  WeatherMapEntity.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 28/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation

class WeatherMapEntity: NSObject {
    var id: Int = 0
    var name: String = ""
    var coordCity: LocationCityEntity = LocationCityEntity()
    var weather: [WeatherEntity] =  [WeatherEntity]()
    var mainStatus: MainStatusEntity = MainStatusEntity()
}
