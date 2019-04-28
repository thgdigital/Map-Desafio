//
//  MainStatusItemMapper.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 28/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation

class MainStatusItemMapper {
    
    static func make(entity: MainStatusEntity) -> MainStatusItem {
        var item = MainStatusItem()
        item.humidity = entity.humidity
        item.pressure = entity.pressure
        item.temp = entity.temp
        item.tempMax = entity.tempMax
        item.tempMin = entity.tempMin
        return item
    }
}
