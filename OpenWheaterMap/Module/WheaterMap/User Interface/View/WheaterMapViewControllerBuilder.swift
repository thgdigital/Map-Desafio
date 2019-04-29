//
//  WheaterMapViewControllerBuilder.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 28/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation


class WheaterMapViewControllerBuilder: StoryboardInstanciate {
    
    var storyboardName: String = "WheaterMap"
    
    func makeScreen(wireframe: SplitWireframe) -> WheaterMapViewController {
        
        let viewController = viewControllerFromStoryboard(withIdentifier: "WheaterMapViewController") as! WheaterMapViewController
        
        let presenter = WheaterPresenterBuilder.make(wirefreame: wireframe)
        
        viewController.presenter = presenter
        
        presenter.output = viewController
        
        return viewController
    }
}
