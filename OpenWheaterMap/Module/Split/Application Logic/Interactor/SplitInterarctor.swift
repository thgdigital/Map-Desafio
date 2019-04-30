//
//  SplitInterarctor.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 29/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation

protocol SplitInterarctorInput {
    func didChanger(temp: Units)
}

class SplitInterarctor: SplitInterarctorInput {
    
    var manager: WeaterManager
    
    init(manager: WeaterManager) {
        self.manager = manager
    }
    
    func didChanger(temp: Units) {
        self.manager.shouldTemp(units: temp)
    }
}
