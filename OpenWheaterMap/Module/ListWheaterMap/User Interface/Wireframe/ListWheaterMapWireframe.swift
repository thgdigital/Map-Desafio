//
//  ListWheaterMapWireframe.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation
import UIKit
class ListWheaterMapWireframe {
    
    var viewController: ListWheterViewController?
    
    func make(wireframe: SplitWireframe, metric: Units) -> UIViewController {
        viewController = ListWheterViewControllerBuilder().make(wireframe: wireframe, metric: metric)
        return viewController!
    }
}
