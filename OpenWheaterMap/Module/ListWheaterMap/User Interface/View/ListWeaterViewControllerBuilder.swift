//
//  ListWheterViewControllerBuilder.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation

class ListWeaterViewControllerBuilder: StoryboardInstanciate {
    
    var storyboardName: String = "ListWeaterMap"
    
    func make(wireframe: SplitWireframe, metric: Units) -> ListWeaterViewController {
        
        let viewController = viewControllerFromStoryboard(withIdentifier: "ListWeaterViewController") as! ListWeaterViewController
        
        let presenter = WeaterPresenterBuilder.make(wirefreame: wireframe, metric: metric)
        
        viewController.presenter = presenter
        
        presenter.output = viewController
        
        return viewController
    }
}
