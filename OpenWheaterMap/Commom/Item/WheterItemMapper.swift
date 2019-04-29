//
//  WheterItemMapper.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 28/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation


class WheterItemMapper {
    
    static func make(from entity: WeatherEntity) -> WheterItem {
        var item = WheterItem()
        item.icon = entity.icon
        item.id = entity.id
        item.main = entity.main
        item.message = entity.message
        return item
    }
    
    static func make(from entity: [WeatherEntity]) -> [WheterItem] {
        return entity.map({ make(from: $0 )})
    }
}
