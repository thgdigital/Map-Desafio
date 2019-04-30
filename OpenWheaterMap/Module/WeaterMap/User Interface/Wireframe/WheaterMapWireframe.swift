//
//  WheaterMapWireframe.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 28/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation

class WeaterMapWireframe {
    
    var viewController: WeaterMapViewController?
    
    func make(wireframe: SplitWireframe, metric: Units) -> WeaterMapViewController {
        viewController = WeaterMapViewControllerBuilder().makeScreen(wireframe: wireframe, metric: metric)
        return viewController!
    }
}
