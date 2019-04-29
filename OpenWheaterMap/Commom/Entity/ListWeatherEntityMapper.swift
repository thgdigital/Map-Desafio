//
//  ListWeatherEntityMapper.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 28/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation
import ObjectMapper

class ListWeatherEntityMapper {
    
    static func make(model: ListWeatherMapModel) -> ListWeatherEntity {
        let entity = ListWeatherEntity()
        entity.cod = model.cod
        entity.count = model.count
        entity.message = model.message
        entity.weatherMap =  WeatherMapEntityMapper.make(from: model.weatherMap)
        return entity
    }
}
