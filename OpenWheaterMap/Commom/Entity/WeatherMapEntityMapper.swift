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
    
    static func make(from model: WeatherMapModel) -> WeatherMapEntity {
        
        let entity = WeatherMapEntity()
        
        entity.id = model.id
        
        entity.name = model.name
        
        if let coordCity = model.coordCity {
            entity.coordCity = LocationCityEntityMapper.make(model: coordCity)
        }
        if let weather = model.weather {
            entity.weather =  WeatherEntityMapper.make(from: weather)
        }
        
        if let main = model.mainStatus {
            entity.mainStatus = MainStatusEntityMapper.make(model: main)
        }
        
        return entity
    }
    
    static func make(from model: [WeatherMapModel]) -> [WeatherMapEntity] {
        return model.map({ make(from: $0) })
    }
}
