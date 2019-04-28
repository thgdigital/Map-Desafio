//
//  WeatherDisplayListMapper.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 28/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation

class WeatherDisplayListMapper {
    
    static func make(item: WeatherMapItem) -> WeatherDisplayList {
        var display = WeatherDisplayList()
        let urlImage = "http://openweathermap.org/img/w/"
        display.humidity = String(item.mainStatus.humidity)
        if let weather = item.weather.first{
            display.icon = "\(urlImage)\(weather.icon).png"
            display.message = weather.message
        }
        
        display.name = item.name
        display.pressure = "\(String(item.mainStatus.pressure)) °"
        display.temp = "\(String(item.mainStatus.temp)) °"
        display.tempMax = "\(String(item.mainStatus.tempMax)) °"
        display.tempMin = "\(String(item.mainStatus.tempMin)) °"
        
        return display
    }
}
