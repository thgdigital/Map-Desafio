//
//  WeatherEntityMapper.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 28/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation

class WeatherEntityMapper {
    
    static func make(model: WeatherModel) -> WeatherEntity {
        let entity = WeatherEntity()
        entity.icon = model.icon
        entity.id = model.id
        entity.main = model.main
        entity.message = model.description
        return entity
    }
}
