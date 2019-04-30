//
//  ListWheaterMapWireframe.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation
import UIKit
class ListWeaterMapWireframe {
    
    var viewController: ListWeaterViewController?
    
    func make(wireframe: SplitWireframe, metric: Units) -> UIViewController {
        viewController = ListWeaterViewControllerBuilder().make(wireframe: wireframe, metric: metric)
        return viewController!
    }
}
