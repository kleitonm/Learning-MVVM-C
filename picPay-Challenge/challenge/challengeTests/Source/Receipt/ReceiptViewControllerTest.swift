//
//  ReceiptViewControllerTest.swift
//  challengeTests
//
//  Created by Kleiton Mendes on 26/03/24.
//

import XCTest
@testable import challenge

final class ReceiptViewControllerTest: XCTestCase {

    // MARK: - Properties
    var sut: ReceiptViewController!
    var homeSpy: HomeProtocolSpy!
    var apiServerMock: ReceiptApiServerSuccessMock!

    // MARK: - Test Lifecycle
    override func setUp() {
        sut = ReceiptViewController()
        apiServerMock = ReceiptApiServerSuccessMock()
    }
    
    override func tearDown() {
        sut = nil
        apiServerMock = nil
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
        XCTAssertEqual(sut.navigationItem.title, "Lista de Comprovantes")
        XCTAssertNotNil(sut.viewDidLoad)
    }
    
    func testViewWillAppear() {
        // When
        sut.viewWillAppear(true)
        // Than
        XCTAssertNotNil(sut.viewWillAppear)
    }
    
    func testFetchFailed() {
        // Given
        var apiFailed = ReceiptApiServerFailedMock()
        // When
        XCTAssertNotNil(apiFailed.fetchData(completion: { _ in }))
    }
    
    func testFetchSucess() {
        XCTAssertNotNil(apiServerMock.fetchData(completion: { _ in }))
    }
    
}
