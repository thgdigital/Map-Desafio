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
    func startLoading()
    func hiddenLoading()
    func udpdateLocation(location: LocationEntity)
}

class WheaterInteractor: WheaterInteractorInput {

    var manager: WheaterManager
    
    var locationManager: LocationManager
    
    var unit: Units = .metric
    
    var locationEntity: LocationEntity = LocationEntity()
    
    weak var output: WheaterInteractorOutput?
    
    init(manager: WheaterManager, locationManager: LocationManager, metric: Units) {
        self.manager = manager
        self.locationManager = locationManager
        self.unit = metric
    }
    
    func startLocation() {
        self.locationManager.startLocation()
        
    }
    
    func didMetrict(unit: Units) {
        self.manager.fetch(location: locationEntity, units: unit)
    }
}

extension WheaterInteractor: WheaterManagerOutput {
    
    func startLoading() {
        self.output?.startLoading()
    }
    
    func hiddenLoading() {
        self.output?.hiddenLoading()
    }
    
    
    func fetch(entity: ListWeatherEntity) {
        self.output?.fetched(items: WeatherMapItemMapper.make(from: entity.weatherMap))
    }
    
    func error(error: Error) {
        self.output?.didError(with: error)
    }

}

extension WheaterInteractor: LocationManagerOutput{
    
    func didUpdateLocation(coordinate: LocationEntity) {
        self.locationEntity = coordinate
        self.manager.fetch(location: locationEntity, units: unit)
        self.output?.udpdateLocation(location: coordinate)
    }
    
    func errorLocation(error: Error) {
        self.output?.didError(with: error)
    }
    
    func disabledLocation() {
        self.output?.disabledLocation()
    }
    
    
}
