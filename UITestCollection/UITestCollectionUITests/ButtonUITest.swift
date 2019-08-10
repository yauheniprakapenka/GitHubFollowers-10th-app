//
//  UITestCollectionUITests.swift
//  UITestCollectionUITests
//
//  Created by yauheni prakapenka on 04/08/2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import XCTest

class ButtonUITest: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDown() { }

    func testOneTapButtonWithIdentifier() {
        app.buttons["Button"].tap()
        app.buttons["1. Нажать на кнопку по идентификатору"].tap()
        app.buttons["ButtonWithID"].tap()
        XCTAssert(app.staticTexts["Тест 1 выполнен успешно"].exists)
    }
    
    func testOneTapButtonWithoutIdentifier() {
        app.buttons["Button"].tap()
        app.buttons["2. Нажать на кнопку без идентификатора"].tap()
        app.buttons["Button without ID"].tap()
        XCTAssert(app.staticTexts["Тест 2 выполнен успешно"].exists)
    }
    
    func testThreeTapButtonWithSameNames() {
        app.buttons["Button"].tap()
        app.buttons["3. Нажать на первую кнопку с одинаковым названием"].tap()
        app.buttons["Button"].firstMatch.tap()
        XCTAssert(app.staticTexts["Тест 3 выполнен успешно"].exists)
    }
    
    func testFourTapAlert() {
        app.buttons["Button"].tap()
        app.buttons["4. Нажать на кнопку в Alert"].tap()
        app.buttons["Button"].tap()
        app.alerts.buttons["Two"].tap()
        XCTAssert(app.staticTexts["Тест 4 выполнен успешно"].exists)
    }
    
    func testFiveTapNavigationButton() {
        app.buttons["Button"].tap()
        app.buttons["5. Нажать на кнопку в Navigation Bar"].tap()
        app.navigationBars.buttons["Camera"].tap()
        XCTAssert(app.staticTexts["Тест 5 выполнен успешно"].exists)
    }
    
    func testSixTapAnActionSheetButton() {
        app.buttons["Button"].tap()
        app.buttons["6. Нажать на кнопку в Activity Sheet"].tap()
        app.buttons["Button"].tap()
        XCTAssert(app.staticTexts["Description"].waitForExistence(timeout: 3))
        app.buttons["One"].tap()
        XCTAssert(app.staticTexts["Тест 6 выполнен успешно"].exists)
    }
    
}


