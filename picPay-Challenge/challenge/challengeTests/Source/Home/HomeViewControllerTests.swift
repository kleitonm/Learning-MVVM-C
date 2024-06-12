//
//  challengeTests.swift
//  challengeTests
//
//  Created by Kleiton Mendes on 26/03/24.
//

import XCTest
@testable import challenge

final class HomeViewControllerTests: XCTestCase {

    // MARK: - Properties
    var sut: HomeViewController!
    var homeSpy: HomeProtocolSpy!

    // MARK: - Test Lifecycle
    override func setUp() {
        sut = HomeViewController()
        homeSpy = HomeProtocolSpy()
    }
    
    override func tearDown() {
        sut = nil
        homeSpy = nil
    }
    
    // MARK: - Unit Tests
    func testLoadView() {
        // When
        sut.loadView()
        
        // Than
        XCTAssertNotNil(sut.loadView)
    }
    
    func testViewDidLoad() {
        // When
        sut.viewDidLoad()
        // Than
        XCTAssertNotNil(sut.viewDidLoad)
    }
    
    func testDidTappedButton() {
        // When
        sut.didTappedButton()
        // Than
        XCTAssertFalse(homeSpy.didTappedButtonCalled)
        XCTAssertNotNil(sut)
    }
}
