//
//  LocationEntityMapper.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation
import CoreLocation


class LocationEntityMapper {
    
    static func make(from location: CLLocationCoordinate2D) -> LocationEntity{
        let user = LocationEntity()
        user.lat = Double(location.latitude)
        user.lng = Double(location.longitude)
        return user
    }
}
