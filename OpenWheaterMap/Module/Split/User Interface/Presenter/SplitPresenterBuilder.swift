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
        
        let presenter = SplitPresenter(wireframe: wireframe)
        
        return presenter
    }
}
