//
//  WeatherMapEntityMapper.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 28/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation
import ObjectMapper


class WeatherMapEntityMapper {
    
    static func make(model: WeatherMapModel) -> WeatherMapEntity {
        
        let entity = WeatherMapEntity()
        
        entity.id = model.id
        
        entity.name = model.name
        
        if let coordCity = model.coordCity {
            entity.coordCity = LocationCityEntityMapper.make(model: coordCity)
        }
        if let weather = model.weather {
            entity.weather = WeatherEntityMapper.make(model: weather)
        }
        
        if let main = model.mainStatus {
            entity.mainStatus = MainStatusEntityMapper.make(model: main)
        }
        
        return entity
    }
}
