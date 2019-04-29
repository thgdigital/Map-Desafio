//
//  LocationManager.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationManagerOutput: class {
    func didUpdateLocation(coordinate: LocationEntity)
    func errorLocation(error: Error)
    func disabledLocation()
}

class LocationManager: NSObject {
    
    static var shared = LocationManager()
    
    weak var output: LocationManagerOutput?
    
    let locationMgr = CLLocationManager()
    
    var location: LocationEntity?
    
    func startLocation(){
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .notDetermined:
            locationMgr.requestWhenInUseAuthorization()
            return
        case .denied, .restricted:
           output?.disabledLocation()
            return
        case .authorizedAlways, .authorizedWhenInUse:
            break
        }
        
        locationMgr.delegate = self
        locationMgr.desiredAccuracy = kCLLocationAccuracyKilometer
        locationMgr.startUpdatingLocation()
        
        self.lastLocation()
    }
}
extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]) {
        
        guard let location = locations.first else {
            self.lastLocation()
            return
        }
        
        self.location = LocationEntityMapper.make(from: location.coordinate)
        self.output?.didUpdateLocation(coordinate: LocationEntityMapper.make(from: location.coordinate))
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.output?.errorLocation(error: error)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        debugPrint(status)
    }
 
    fileprivate func lastLocation(){
        
        guard let location = self.location else { return }
        
        self.output?.didUpdateLocation(coordinate: location)
    }
}
