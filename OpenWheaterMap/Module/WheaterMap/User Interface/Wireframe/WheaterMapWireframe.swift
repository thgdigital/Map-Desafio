//
//  WheaterMapWireframe.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 28/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation

class WheaterMapWireframe {
    
    var viewController: WheaterMapViewController?
    
    func make(wireframe: SplitWireframe) -> WheaterMapViewController {
        viewController = WheaterMapViewControllerBuilder().makeScreen(wireframe: wireframe)
        return viewController!
    }
}
