//
//  NewsListVCTests.swift
//  TimesAppTests
//
//  Created by Arvind on 10/07/22.
//

import XCTest
@testable import TimesApp

class NewsListVCTests: XCTestCase {
    
    // MARK: - Properties
    var newsListVC: NewsListVC!
    
    // MARK: - XCTest Life Cycle
    override func setUp() {
        super.setUp()
        newsListVC = NewsListVC.instantiateViewController(storyboard: .main)
        newsListVC.viewModel = NewsListVM()
        _ = newsListVC.view
    }
    
    override func tearDown() {
        super.tearDown()
        newsListVC = nil
    }
    
    func testOutletNotNil() {
        XCTAssertNotNil(newsListVC.tableView, "View Controller does not have UITableView property")
        XCTAssertNotNil(newsListVC.searchBar, "View Controller does not have UISearchBar property")
    }
    
    func testDelegateNotNil() {
        XCTAssertNotNil(newsListVC.tableView.delegate, "UITableView does not have Delegate")
        XCTAssertNotNil(newsListVC.searchBar.delegate, "UISearchBar does not have Delegate")
    }
    
    func testDataSourceNotNil() {
        XCTAssertNotNil(newsListVC.tableView.dataSource, "UITableView does not have DataSource")
    }
}
