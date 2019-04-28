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

protocol WheaterManagerOutput: class {
    func fetch(entity: ListWeatherEntity)
    func error(error: Error)
}

class WheaterManager {
    
    weak var output: WheaterManagerOutput?
    
    var baseUrl: String = "http://api.openweathermap.org/data/2.5/find"
    
    static var shared = WheaterManager()
    
    func fetch(lat: Double, lng: Double, units: Units){
        
        let parameters: Parameters = [
            "lat": lat,
            "lon": lng,
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
                
            case .failure(let error):
                self.output?.error(error: error)
            }
        }
       
    }
}
