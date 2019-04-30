//
//  WheaterPresenterBuilder.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation


class WeaterPresenterBuilder {
    
    static func make(wirefreame: SplitWireframe, metric: Units) -> WeaterPresenter {
        
        let interactor = WeaterInteractorBuilder.make(metric: metric)
        
        let presenter = WeaterPresenter(wirefreame: wirefreame, interactor: interactor)
        
        interactor.output = presenter
        
        return presenter
    }
}
