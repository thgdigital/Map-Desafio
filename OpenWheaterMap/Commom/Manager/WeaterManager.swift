//
//  HomeManager.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

protocol WeaterManagerOutput: class {
    func fetch(entity: ListWeatherEntity)
    func error(error: Error)
    func startLoading()
    func hiddenLoading()
}

class WeaterManager {
    
    weak var output: WeaterManagerOutput?
    
    var baseUrl: String = "http://api.openweathermap.org/data/2.5/find"
    
    static var shared = WeaterManager()
    
    var location: LocationEntity? = nil
    
    func shouldTemp(units: Units){
        if let location = self.location {
            self.fetch(location: location, units: units)
        }
    }
    
    func fetch(location: LocationEntity, units: Units){
        self.output?.startLoading()
        
        self.location = location
        
        let parameters: Parameters = [
            "lat": location.lat,
            "lon": location.lng,
            "cnt": "50",
            "appid":"240df133d3bf8d27abc140fe6e9d15ef",
            "lang": "pt",
            "units": units.rawValue
        ]
        
        Alamofire.request(baseUrl, parameters: parameters).responseJSON { response in
            
            switch response.result {
                
            case .success:
                guard  let listItem = Mapper<ListWeatherMapModel>().map(JSONObject:response.result.value) else { return }
                self.output?.fetch(entity: ListWeatherEntityMapper.make(model: listItem))
                self.output?.hiddenLoading()
            case .failure(let error):
                self.output?.error(error: error)
                self.output?.hiddenLoading()
            }
        }
        
    }
}
