//
//  WeatherMapItemMapper.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 28/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation

class WeatherMapItemMapper {
    
    static func make(entity: WeatherMapEntity) ->WeatherMapItem {
       
        let item = WeatherMapItem()
        
        item.coordCity  = LocationCityItemMapper.make(entity: entity.coordCity)
        
        item.weather = entity.weather.map({ WheterItemMapper.make(entity: $0)})
        
        item.id = entity.id
        
        item.name = entity.name
        
        
        item.mainStatus = MainStatusItemMapper.make(entity: entity.mainStatus)
        
        return item
    }
}
