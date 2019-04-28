//
//  LocationCityItemMapper.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 28/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation

class LocationCityItemMapper {
    
    static func make(entity: LocationCityEntity) -> LocationCityItem {
        var item = LocationCityItem()
        item.lat = entity.lat
        item.lon = entity.lon
        return item
    }
}
