//
//  SplitWireframe.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation
import UIKit

class SplitWireframe {
    
    var viewController: SplitViewController?
    
    func make() -> UIViewController {
        viewController = SplitViewControllerBuilder().make(wireframe: self)
        return viewController!
    }
    
    func listScreen(metric: Units){

        executeOnMainQueue {
            
            guard let viewController = self.viewController else { return }
           
            self.removeAll(container: viewController.containerView, viewController: self.viewController)
            
            let listViewcontroller = ListWeaterMapWireframe().make(wireframe: self, metric: metric)
            
            self.addView(view: listViewcontroller.view, container: viewController.containerView)

            self.addViewController(viewController: listViewcontroller, containerController: viewController)

        }
    }
    
    func mapScreen(metric: Units){
        
        executeOnMainQueue {
            
            guard let viewController = self.viewController else { return }
            
            self.removeAll(container: viewController.containerView, viewController: self.viewController)
            
            let listViewcontroller = WeaterMapWireframe().make(wireframe: self, metric: metric)
            
            self.addView(view: listViewcontroller.view, container: viewController.containerView)
            
            self.addViewController(viewController: listViewcontroller, containerController: viewController)
            
        }
    }
    
    fileprivate func addView(view: UIView, container: UIView?) {
        guard let container = container else { return }
        
        view.frame = container.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        container.addSubview(view)
    }
    
    fileprivate func addViewController(viewController: UIViewController, containerController: UIViewController?) {
        guard let containerController = containerController else { return }
        containerController.addChild(viewController)
        viewController.willMove(toParent: containerController)
    }
    
    fileprivate func removeAll(container: UIView?, viewController: UIViewController?) {
        removeViews(container: container)
        removeViewControllers(viewController: viewController)
    }
    
    fileprivate func removeViews(container: UIView?) {
        guard let container = container else { return }
        _ = container.subviews.map({ $0.removeFromSuperview() })
    }
    
    fileprivate func removeViewControllers(viewController: UIViewController?) {
        guard let viewController = viewController  else { return }
        viewController.willMove(toParent: nil)
        _ = viewController.children.map({ $0.removeFromParent() })
    }
}
