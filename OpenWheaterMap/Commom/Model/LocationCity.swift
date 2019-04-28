//
//  LocationCity.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation
import ObjectMapper

class LocationCity: Mappable {
    var lat: Double = 0.0
    var lon: Double = 0.0
    
    required init?(map: Map) {}
    
     func mapping(map: Map) {
        lat   <- map["lat"]
        lon  <- map["lon"]
    }
}
