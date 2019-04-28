//
//  WheaterPresenter.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation

protocol WheaterPresenterInput {
    func viewDidLoad()
    func didChanger(with unit: Units)
}

protocol WheaterPresenterOuput: class {
    func alertView(title: String, description: String)
    func fetched(items: [WeatherMapItem])
}

enum Units: String {
    case imperial = "imperial"
    case metric = "metric"
}

class WheaterPresenter: WheaterPresenterInput {
    
    weak var output: WheaterPresenterOuput?
    var interactor: WheaterInteractorInput
    var wirefreame: SplitWireframe
    
    init(wirefreame: SplitWireframe, interactor: WheaterInteractorInput) {
        self.wirefreame = wirefreame
        self.interactor = interactor
    }
    
    func viewDidLoad() {
      self.interactor.startLocation()
    }
    
    func didChanger(with unit: Units) {
        self.interactor.didMetrict(unit: unit)
    }
}

extension WheaterPresenter:  WheaterInteractorOutput {
    
    func fetched(items: [WeatherMapItem]) {
        self.output?.fetched(items: items)
    }
    
    
    func didError(with error: Error) {
        
    }
    
    func disabledLocation() {
        self.output?.alertView(title: "Opss Error", description: "Sua localizão esta desligada")
    }
    
    
}
