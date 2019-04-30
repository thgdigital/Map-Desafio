//
//  WeaterItemMapper.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 28/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation
import CoreLocation

class WeaterItemMapper {
    
    static func make(from entity: WeatherEntity) -> WeaterItem {
        var item = WeaterItem()
        item.icon = entity.icon
        item.id = entity.id
        item.main = entity.main
        item.message = entity.message
        return item
    }
    
    static func make(from entity: [WeatherEntity]) -> [WeaterItem] {
        return entity.map({ make(from: $0 )})
    }
}
