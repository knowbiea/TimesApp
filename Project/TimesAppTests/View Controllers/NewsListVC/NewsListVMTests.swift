//
//  NewsListVMTests.swift
//  TimesAppTests
//
//  Created by Arvind on 10/07/22.
//

import XCTest
@testable import TimesApp

class NewsListVMTests: XCTestCase {
    
    // MARK: - Properties
    var viewModel: NewsListVM!
    
    // MARK: - XCTestCase
    override func setUp() {
        super.setUp()
        viewModel = NewsListVM()
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }
    
    func testMockNewsAPICalling() {
        // Given
        let newsListVM = viewModel
        newsListVM?.networkManager = MockConstants.networkManager
        let expectation = self.expectation(description: "Testing News API Calling")
        
        // When
        newsListVM?.getNewsListNews(completion: { success, error in
            expectation.fulfill()
        })
        
        // Then
        waitForExpectations(timeout: 20) { error in
            XCTAssertNotNil(newsListVM?.newsArray)
            XCTAssertNotNil(newsListVM?.newsFilteredArray)
            XCTAssertEqual(newsListVM?.newsArray?.count, 20)
            XCTAssertNotNil(newsListVM?.newsArray?.first)
            
            XCTAssertEqual(newsListVM?.newsArray?.first?.title, "Biden Takes Tumble During Bike Ride in Delaware")
            XCTAssertEqual(newsListVM?.newsArray?.first?.byline, "By Zach Montague")
            XCTAssertEqual(newsListVM?.newsArray?.first?.source, "New York Times")
            XCTAssertEqual(newsListVM?.newsArray?.first?.publishedDate, "2022-06-18")
        }
    }
    
    func testSearchNewsData() {
        // Given
        let newsListVM = viewModel
        newsListVM?.networkManager = MockConstants.networkManager
        let response = Mock().loadJSON(filename: "News", type: NewsList.self)
        newsListVM?.newsArray = response.results
        
        // When
        viewModel?.searchNews("Biden", completion: {
            // Then
            XCTAssertNotNil(newsListVM?.newsFilteredArray)
            XCTAssertEqual(newsListVM?.newsFilteredArray?.count, 2)
        })
    }
}
