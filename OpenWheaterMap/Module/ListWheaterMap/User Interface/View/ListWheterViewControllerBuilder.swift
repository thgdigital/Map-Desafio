//
//  ListWheterViewControllerBuilder.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation

class ListWheterViewControllerBuilder: StoryboardInstanciate {
    
    var storyboardName: String = "ListWheaterMap"
    
    func make(wireframe: SplitWireframe, metric: Units) -> ListWheterViewController {
        
        let viewController = viewControllerFromStoryboard(withIdentifier: "ListWheterViewController") as! ListWheterViewController
        
        let presenter = WheaterPresenterBuilder.make(wirefreame: wireframe, metric: metric)
        
        viewController.presenter = presenter
        
        presenter.output = viewController
        
        return viewController
    }
}
