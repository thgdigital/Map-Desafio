//
//  WeatherModel.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation
import ObjectMapper


class WeatherModel: Mappable {
    var id: Int = 0
    var main: String = ""
    var description: String = ""
    var icon: String = ""

    required init?(map: Map) {}
    
     func mapping(map: Map) {
        id          <- map["id"]
        main        <- map["main"]
        description <- map["description"]
        icon        <- map["icon"]
    }
    
    
}
