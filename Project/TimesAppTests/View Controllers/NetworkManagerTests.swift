//
//  NetworkManagerTests.swift
//  TimesAppTests
//
//  Created by Arvind on 22/07/22.
//

import XCTest
@testable import TimesApp

class NetworkManagerTests: XCTestCase {
    
    func testMockNewsAPICalling() {        
        // Given
        var newsArray: [News]?
        let expectation = self.expectation(description: "Testing Most Popular API Calling")
        
        // When
        Constants.networkManager.apiModelRequest(NewsList.self, .news) { response in
            newsArray = response.results
            expectation.fulfill()
            
        } failure: { error in
            print("Error: \(error)")
            expectation.fulfill()
        }

        // Then
        waitForExpectations(timeout: 20) { error in
            XCTAssertNotNil(newsArray)
            XCTAssertEqual(newsArray?.count, 20)
            XCTAssertNotNil(newsArray?.first)
            
            XCTAssertNotNil(newsArray?.first?.title)
            XCTAssertNotNil(newsArray?.first?.byline)
            XCTAssertNotNil(newsArray?.first?.source)
            XCTAssertNotNil(newsArray?.first?.publishedDate)
        }
    }
}
