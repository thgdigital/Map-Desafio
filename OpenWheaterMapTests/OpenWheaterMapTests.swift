//
//  OpenWheaterMapTests.swift
//  OpenWheaterMapTests
//
//  Created by THIAGO on 27/04/19.
//  Copyright © 2019 THIAGO. All rights reserved.
//

import XCTest
@testable import OpenWheaterMap

class OpenWheaterMapTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testInteractor(){
        let interactor = WheaterInteractorBuilder.make(metric: .metric)
        XCTAssertEqual(interactor.unit, .metric)
        XCTAssertNil(interactor.output, "Esta nil sua referencia de output de Interactor")
    }
    
    func testPresenter(){
        let wireframe = SplitWireframe()
        let presenter = WheaterPresenterBuilder.make(wirefreame: wireframe , metric: .metric)
        XCTAssertEqual(presenter.radius, 30000)
        XCTAssertNil(presenter.output, "Esta vazio sua referencia de output de presenter")
        
    }
    
}

