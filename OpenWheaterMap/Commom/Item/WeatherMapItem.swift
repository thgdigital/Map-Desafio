//
//  WeatherMapItem.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 28/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation

class WeatherMapItem:  NSObject {
    var id: Int = 0
    var name: String = ""
    var coordCity: LocationCityItem = LocationCityItem()
    var weather: [WeaterItem] = [WeaterItem]()
    var mainStatus: MainStatusItem = MainStatusItem()
}
