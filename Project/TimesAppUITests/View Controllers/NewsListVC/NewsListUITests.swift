//
//  TimesAppUITests.swift
//  TimesAppUITests
//
//  Created by Arvind on 08/07/22.
//

import XCTest

class TimesAppUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        
    }

    func testGetNewsListScreen() throws {
        
        let app = XCUIApplication()
        app.launch()

//        let getNewsButton = app.staticTexts["Get News"]
//        XCTAssertTrue(getNewsButton.exists)
//
//        getNewsButton.tap()

        let tableView = app.tables["newsListTableView"]
        XCTAssertTrue(tableView.exists, "Table does not exist")

        let searchBar = app.searchFields["Search News"]
        XCTAssertTrue(searchBar.exists, "SearchBar does not exist")

        let complaintCell = tableView.cells.firstMatch
        XCTAssert(complaintCell.waitForExistence(timeout: 10))

        let titleLabel = complaintCell.staticTexts["newsListTableViewCell"]
        XCTAssertTrue(titleLabel.exists, "Title Label does not exist")
        
        XCTAssertTrue(app.otherElements[AccessibilityIdentifier.newsListView].waitForExistence(timeout: 5))
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
