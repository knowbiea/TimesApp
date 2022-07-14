//
//  MainUITest.swift
//  TimesAppUITests
//
//  Created by Arvind on 14/07/22.
//

import XCTest

class MainUITest: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetNewsButtonExists() throws {
        let app = XCUIApplication()
        app.launch()

        let getNewsButton = app.staticTexts["Get News"]
        XCTAssertTrue(getNewsButton.exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
