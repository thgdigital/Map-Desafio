//
//  Extensios.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    var isVisible: Bool { return self.isViewLoaded && self.view.window != nil }
    
    func addChildViewController(childController: UIViewController? = nil, subViewToAdd subview: UIView? = nil, container: UIView) {
        
        guard let _childController = childController else {
            print("Unable to successfully execute addSubview since there isn't no viewController to add.")
            return
        }
        
        self.addChild(_childController)
        
        self.addSubview(subview ?? _childController.view, inContainer: container)
        
        _childController.didMove(toParent: self)
    }
    
    func addSubview(_ subview: UIView?, inContainer container: UIView?) {
        UIViewController.addSubviewToViewController(self, subview: subview, container: container)
    }
    
    fileprivate class func addSubviewToViewController(_ _viewController: UIViewController, subview: UIView? = nil, container: UIView? = nil) {
        
        guard let _subview = subview else {
            print("Unable to successfully execute addSubview since there isn't no subview to add.")
            return
        }
        
        guard let _parentView = container ?? _viewController.view else {
            print("Unable to successfully execute addSubview since the parentView does not exist.")
            return
        }
        
        _parentView.removeAllSubviews()
        _parentView.addSubview(_subview)
        _subview.boundInside(_parentView)
    }
    
    func removeFromParentView(container: UIView?) {
        
        guard let _container = container else {
            print("Unable to remove non existent subviews from container or view of Parent View Controller.")
            return
        }
        
        _container.removeAllSubviews()
        
        self.willMove(toParent: nil)
        NSLayoutConstraint.deactivate(self.view.constraints)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
}


// MARK: - UIView

public extension UIView {
    
    func boundInside(_ superView: UIView) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        superView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[subview]-0-|", options: NSLayoutConstraint.FormatOptions(), metrics:nil, views:["subview":self]))
        superView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[subview]-0-|", options: NSLayoutConstraint.FormatOptions(), metrics:nil, views:["subview":self]))
    }
    
    func removeAllSubviews() {
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
    }
}

protocol StoryboardInstanciate {
    var storyboardName: String { get }
    func viewControllerFromStoryboard(withIdentifier identifier: String) -> UIViewController
}

extension StoryboardInstanciate {
    
    var storyboard: UIStoryboard {
        return UIStoryboard(name: self.storyboardName, bundle: nil)
    }
    
    func viewControllerFromStoryboard(withIdentifier identifier: String) -> UIViewController {
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
}

func executeInBackground(_ completion: @escaping () -> Void ) {
    DispatchQueue.global(qos: .background).async {
        completion()
    }
}

func executeOnMainQueue(_ completion: @escaping () -> Void ) {
    if Thread.isMainThread {
        completion()
    } else {
        DispatchQueue.main.async(execute: {
            completion()
        })
    }
}

