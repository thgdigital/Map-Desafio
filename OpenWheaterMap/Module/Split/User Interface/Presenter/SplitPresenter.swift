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
    func didTapTemp()
    func didTapView()
}

protocol SplitPresenterOutput: class {
    func changeTitleTemp(nameImage: String)
    func changeTitleView(nameImage: String)
}

enum ViewStates: String {
    case map = "map"
    case list = "list"
}

class SplitPresenter: SplitPresenterInput {
    
    var wireframe: SplitWireframe
    
    var viewStates: ViewStates = .map
    
    var interactor: SplitInterarctor
    
    var output: SplitPresenterOutput?
    
    var metric: Units = .metric
    
    init(wireframe: SplitWireframe, interactor: SplitInterarctor) {
        self.wireframe = wireframe
        self.interactor = interactor
    }
    
    func viewWillAppear() {}
    
    func viewDidLoad() {
        wireframe.mapScreen(metric: self.metric)
    }
    
    func didTapTemp() {
        switch metric {
        case .imperial:
            metric = .metric
            output?.changeTitleTemp(nameImage: "celsius")
        default:
            metric = .imperial
            output?.changeTitleTemp(nameImage: "fahrenheit")
        }
        
        self.interactor.didChanger(temp: metric)
    }
    
    func didTapView(){
        switch viewStates {
        case .map:
            self.viewStates = .list
            self.output?.changeTitleView(nameImage: "list")
            self.wireframe.listScreen(metric: self.metric)
        default:
            self.viewStates = .map
            self.output?.changeTitleView(nameImage: "map")
            self.wireframe.mapScreen(metric: self.metric)
        }
    }
}
