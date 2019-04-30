//
//  WheaterMapViewControllerBuilder.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 28/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation


class WeaterMapViewControllerBuilder: StoryboardInstanciate {
    
    var storyboardName: String = "WeaterMap"
    
    func makeScreen(wireframe: SplitWireframe, metric: Units) -> WeaterMapViewController {
        
        let viewController = viewControllerFromStoryboard(withIdentifier: "WeaterMapViewController") as! WeaterMapViewController
        
        let presenter = WeaterPresenterBuilder.make(wirefreame: wireframe, metric: metric)
                
        viewController.presenter = presenter
        
        presenter.output = viewController
        
        return viewController
    }
}
