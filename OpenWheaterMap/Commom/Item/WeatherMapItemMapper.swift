//
//  WeatherMapItemMapper.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 28/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation

class WeatherMapItemMapper {
    
    static func make(from entity: WeatherMapEntity) ->WeatherMapItem {
       
        let item = WeatherMapItem()
        
        item.coordCity  = LocationCityItemMapper.make(entity: entity.coordCity)

        item.weather = WheterItemMapper.make(from: entity.weather)
        
        item.id = entity.id
        
        item.name = entity.name
        
        
        item.mainStatus = MainStatusItemMapper.make(entity: entity.mainStatus)
        
        return item
    }
    
    static func make(from entity: [WeatherMapEntity]) -> [WeatherMapItem] {
        return entity.map({ make(from: $0)})
    }
}
