//
//  MainStatus.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation
import ObjectMapper

class MainStatus: Mappable {
    
    var temp: Int = 0
    var pressure: Int = 0
    var humidity:Int = 0
    var tempMin: Int = 0
    var tempMax: Int = 0
    
    required init?(map: Map) {}
    
     func mapping(map: Map) {
        temp        <- map["temp"]
        pressure    <- map["pressure"]
        humidity    <- map["humidity"]
        tempMin     <- map["temp_min"]
        tempMax     <- map["temp_max"]
    }

}
