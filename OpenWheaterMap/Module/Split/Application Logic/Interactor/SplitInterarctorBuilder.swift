//
//  SplitInterarctorBuilder.swift
//  OpenWheaterMap
//
//  Created by THIAGO on 29/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import Foundation


class SplitInterarctorBuilder {
    
    static func make() -> SplitInterarctor {
       let manager = WeaterManager.shared
       return SplitInterarctor(manager: manager)
    }
}
