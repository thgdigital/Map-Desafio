//
//  SplitPresenter.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 28/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation

protocol SplitPresenterInput {
    func viewDidLoad()
    func viewWillAppear()
}
class SplitPresenter: SplitPresenterInput {
    
    var wireframe: SplitWireframe
    
    init(wireframe: SplitWireframe) {
        self.wireframe = wireframe
    }
    
    func viewWillAppear() {}
    
    func viewDidLoad(){
        wireframe.ListScreen()
    }
}
