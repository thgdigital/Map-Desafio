//
//  WheaterPresenterBuilder.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation


class WheaterPresenterBuilder {
    
    static func make(wirefreame: SplitWireframe) -> WheaterPresenter {
        
        let interactor = WheaterInteractorBuilder.make()
        
        let presenter = WheaterPresenter(wirefreame: wirefreame, interactor: interactor)
        
        interactor.output = presenter
        
        return presenter
    }
}
