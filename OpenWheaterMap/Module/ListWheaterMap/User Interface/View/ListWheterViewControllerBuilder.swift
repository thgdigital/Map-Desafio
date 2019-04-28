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
    
    func make(wireframe: SplitWireframe) -> ListWheterViewController {
        
        let viewController = viewControllerFromStoryboard(withIdentifier: "ListWheterViewController") as! ListWheterViewController
        
        let presenter = WheaterPresenterBuilder.make(wirefreame: wireframe)
        
        viewController.presenter = presenter
        
        presenter.output = viewController
        
        return viewController
    }
}
