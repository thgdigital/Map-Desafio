//
//  HomeInteractor.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation

protocol WheaterInteractorInput {
    func startLocation()
    func didMetrict(unit: Units)
}
protocol WheaterInteractorOutput: class {
    func didError(with error: Error)
    func disabledLocation()
    func fetched(items: [WeatherMapItem])
}

class WheaterInteractor: WheaterInteractorInput {

    var manager: WheaterManager
    
    var locationManager: LocationManager
    
    var unit: Units = .imperial
    
    var locationEntity: LocationEntity = LocationEntity()
    
    weak var output: WheaterInteractorOutput?
    
    init(manager: WheaterManager, locationManager: LocationManager) {
        self.manager = manager
        self.locationManager = locationManager
    }
    
    func startLocation() {
        self.locationManager.startLocation()
    }
    
    func didMetrict(unit: Units) {
        self.manager.fetch(lat: locationEntity.lat, lng: locationEntity.lng, units: unit)
    }
}

extension WheaterInteractor: WheaterManagerOutput {
    
    func fetch(entity: ListWeatherEntity) {
        self.output?.fetched(items: entity.weatherMap.map({ WeatherMapItemMapper.make(entity: $0) }))
    }
    
    func error(error: Error) {
        self.output?.didError(with: error)
    }

}

extension WheaterInteractor: LocationManagerOutput{
    
    func didUpdateLocation(coordinate: LocationEntity) {
        self.locationEntity = coordinate
        self.manager.fetch(lat: coordinate.lat, lng: coordinate.lng, units: unit)
    }
    
    func errorLocation(error: Error) {
        self.output?.didError(with: error)
    }
    
    func disabledLocation() {
        self.output?.disabledLocation()
    }
    
    
}
