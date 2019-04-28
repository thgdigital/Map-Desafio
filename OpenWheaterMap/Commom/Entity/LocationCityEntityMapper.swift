//
//  LocationCityEntityMapper.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 28/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation

class LocationCityEntityMapper {
    
    static func make(model: LocationCity) -> LocationCityEntity {
        let entity = LocationCityEntity()
        entity.lat = model.lat
        entity.lon = model.lon
        return entity
    }
}
