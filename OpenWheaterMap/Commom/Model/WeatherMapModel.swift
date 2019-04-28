//
//  WeatherMapModel.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation
import ObjectMapper

class WeatherMapModel: Mappable {
    var id: Int = 0
    var name: String = ""
    var coordCity: LocationCity?
    var weather: WeatherModel?
    var mainStatus: MainStatus?
    
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id          <- map["id"]
        name        <- map["name"]
        coordCity   <- map["coord"]
        weather     <- map["weather"]
        mainStatus  <- map["main"]
    }
    
    
}
