//
//  WeatherMapItemMapper.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 28/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation
import CoreLocation

class WeatherMapItemMapper {
    
    static func make(from entity: WeatherMapEntity) -> WeatherMapItem {
       
        let item = WeatherMapItem()
        
        item.coordCity  = LocationCityItemMapper.make(entity: entity.coordCity)

        item.weather = WeaterItemMapper.make(from: entity.weather)
        
        item.id = entity.id
        
        item.name = entity.name
        
        
        item.mainStatus = MainStatusItemMapper.make(entity: entity.mainStatus)
        
        return item
    }
    
    static func make(from entity: [WeatherMapEntity], myLocation: LocationEntity) -> [WeatherMapItem] {
        var items = entity.map({ make(from: $0)})
        items.sort(by: { distance(to: $0.coordCity, myLocation: myLocation) <  distance(to: $1.coordCity, myLocation: myLocation)})
        return items
    }

  static func distance(to location: LocationCityItem, myLocation: LocationEntity) -> CLLocationDistance {
        let location    = CLLocation(latitude: location.lat, longitude: location.lon)
        let myLocation  = CLLocation(latitude: myLocation.lat, longitude: myLocation.lng)
    
        return location.distance(from: myLocation) / 1000
    }
}
