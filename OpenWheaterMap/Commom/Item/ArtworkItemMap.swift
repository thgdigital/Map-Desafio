//
//  ArtworkItemMap.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 29/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation
import CoreLocation

class  ArtworkItemMap {
    
    static func make(from item: WeatherMapItem) -> ArtworkItem {
        let mapPin = ArtworkItem()
        let urlImage = "http://openweathermap.org/img/w/"
        mapPin.id = item.id
        if let weather = item.weather.first {
            mapPin.urlImage = "\(urlImage)\(weather.icon).png"
            mapPin.subtitle = "\(weather.message)"
        }
        mapPin.title = "\(item.mainStatus.temp) °"
        mapPin.coordinate = CLLocationCoordinate2DMake(item.coordCity.lat, item.coordCity.lon)

        return mapPin
    }
    
    static func make(from items: [WeatherMapItem]) -> [ArtworkItem] {
        return items.map({ make(from: $0) })
    }
}
