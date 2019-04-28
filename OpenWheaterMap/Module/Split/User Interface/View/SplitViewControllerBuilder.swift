//
//  SplitViewControllerBuilder.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation


class SplitViewControllerBuilder: StoryboardInstanciate {
    
    var storyboardName: String = "Main"
    
    func make(wireframe: SplitWireframe) -> SplitViewController {
        
        let viewController = viewControllerFromStoryboard(withIdentifier: "SplitViewController") as! SplitViewController
        viewController.presenter = SplitPresenterBuilder.make(wireframe: wireframe)
        
        return viewController
    }
}
