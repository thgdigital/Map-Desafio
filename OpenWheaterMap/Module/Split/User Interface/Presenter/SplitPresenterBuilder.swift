//
//  SplitPresenterBuilder.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 28/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation

class SplitPresenterBuilder {
    
    static func make(wireframe: SplitWireframe) -> SplitPresenter {
        
        let interactor = SplitInterarctorBuilder.make()
        
        let presenter = SplitPresenter(wireframe: wireframe, interactor: interactor)
    
        return presenter
    }
}
