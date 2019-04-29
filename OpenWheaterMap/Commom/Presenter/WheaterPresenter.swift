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

@objc protocol WheaterPresenterOuput: NSObjectProtocol {
    @objc func alertView(title: String, description: String)
    @objc func startLoading()
    @objc func hiddenLoading()
    @objc optional func fetched(items: [WeatherMapItem])
    @objc optional func fetched(artworkItem: [ArtworkItem])
    @objc optional func startMap(lat: Double, long: Double, radius: Double)
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
        self.output?.startMap?(lat: -22.9035393, long: -43.2095869, radius: 5000)
        self.output?.startLoading()
    }
    
    func didChanger(with unit: Units) {
        self.interactor.didMetrict(unit: unit)
    }
}

extension WheaterPresenter: WheaterInteractorOutput {
    
    func startLoading() {
        self.output?.startLoading()
    }
    
    func hiddenLoading() {
        self.output?.hiddenLoading()
        
    }
    
    
    func fetched(items: [WeatherMapItem]) {
        self.output?.fetched?(items: items)
        self.output?.fetched?(artworkItem: ArtworkItemMap.make(from: items))
        
    }
    
    func didError(with error: Error) {
        
    }
    
    func disabledLocation() {
        self.output?.hiddenLoading()
        self.output?.alertView(title: "Opss Error", description: "Sua localizão esta desativada")
    }
    
    
}
