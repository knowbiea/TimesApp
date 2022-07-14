//
//  TimesAppTests.swift
//  TimesAppTests
//
//  Created by Arvind on 08/07/22.
//

import XCTest
@testable import TimesApp

class MainVCTests: XCTestCase {
    
    // MARK: - Properties
    var mainVC: MainVC!
    
    // MARK: - XCTest Life Cycle
    override func setUp() {
        super.setUp()
        mainVC = MainVC.instantiateViewController(storyboard: .main)
        _ = mainVC.view
    }
    
    override func tearDown() {
        super.tearDown()
        mainVC = nil
    }
    
    func testOutletNotNil() {
        XCTAssertNotNil(mainVC.getNewsButton, "View Controller does not have UIButton property")
    }
    
    func testIfGetNewsButtonHasActionAssigned() {
        guard let getNewsActions = mainVC.getNewsButton.actions(forTarget: mainVC, forControlEvent: .touchUpInside) else {
            XCTFail("UIButton does not have actions assigned for Control Event .touchUpInside")
            return
        }
        
        XCTAssertTrue(getNewsActions.contains("getNewsAction:"))
    }
}
