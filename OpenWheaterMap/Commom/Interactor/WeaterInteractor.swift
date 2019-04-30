//
//  HomeInteractor.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation

protocol WeaterInteractorInput {
    func startLocation()
    func didMetrict(unit: Units)
}
protocol WeaterInteractorOutput: class {
    func didError(with error: Error)
    func disabledLocation()
    func fetched(items: [WeatherMapItem])
    func startLoading()
    func hiddenLoading()
    func udpdateLocation(location: LocationEntity)
}

class WeaterInteractor: WeaterInteractorInput {

    var manager: WeaterManager
    
    var locationManager: LocationManager
    
    var unit: Units = .metric
    
    var locationEntity: LocationEntity = LocationEntity()
    
    var listWeatherEntity = ListWeatherEntity()
    
    weak var output: WeaterInteractorOutput?
    
    init(manager: WeaterManager, locationManager: LocationManager, metric: Units) {
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

extension WeaterInteractor: WeaterManagerOutput {
    
    func startLoading() {
        self.output?.startLoading()
    }
    
    func hiddenLoading() {
        self.output?.hiddenLoading()
    }
    
    
    func fetch(entity: ListWeatherEntity) {
        self.listWeatherEntity = entity
        self.output?.fetched(items: WeatherMapItemMapper.make(from: entity.weatherMap, myLocation: self.locationEntity))
    }
    
    func error(error: Error) {
        self.output?.didError(with: error)
    }
    
}

extension WeaterInteractor: LocationManagerOutput{
    
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
