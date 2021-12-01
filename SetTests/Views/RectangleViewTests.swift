//
//  RectangleViewTests.swift
//  SetTests
//
//  Created by Patricia Fulk on 11/23/21.
//

import XCTest
import ViewInspector
@testable import Set

extension RectangleView: Inspectable { }

class RectangleViewTests: XCTestCase {
    var sut: RectangleView!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testExample() throws {
        sut = RectangleView(color: "red", number: 1, shading: "solid")
        let rectangleView = try? sut.inspect().findAll(ViewType.Shape.self,
                                                       where: {try $0.foregroundColor() == .red})
        
        XCTAssertNotNil(rectangleView)
        XCTAssertEqual(rectangleView?.count, 1)        
    }

}
