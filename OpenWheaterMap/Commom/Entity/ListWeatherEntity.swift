//
//  ListWeatherEntity.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 28/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation

class ListWeatherEntity: NSObject {
    var message: String = ""
    var cod: String = ""
    var count: Int = 0
    var weatherMap: [WeatherMapEntity] = []
}
