//
//  MainStatusEntityMapper.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 28/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation

class MainStatusEntityMapper {
    
    static func make(model: MainStatus) -> MainStatusEntity {
        
        let entity = MainStatusEntity()
        entity.humidity = model.humidity
        entity.pressure = model.pressure
        entity.temp = model.temp
        entity.tempMax = model.tempMax
        entity.tempMin = model.tempMin
        
        return entity
    }
}
