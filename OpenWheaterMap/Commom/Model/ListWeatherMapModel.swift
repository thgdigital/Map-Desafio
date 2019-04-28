//
//  ListWeatherMapModel.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation
import ObjectMapper

class ListWeatherMapModel: Mappable {
    var message: String = ""
    var cod: String = ""
    var count: Int = 0
    
    var weatherMap: [WeatherMapModel] = [WeatherMapModel]()
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        message <- map["message"]
        cod <- map["cod"]
        count <- map["count"]
        weatherMap <- map["list"]
    }

}
