//
//  ReceiptDetailsViewControllerTest.swift
//  challengeTests
//
//  Created by Kleiton Mendes on 26/03/24.
//

import XCTest
@testable import challenge

final class ReceiptDetailsViewControllerTest: XCTestCase {
   
    // MARK: - Properties
    var sut: ReceiptDetailsViewController!
    var viewModelMock: ReceiptListModelMock!
    var apiServerMock: ReceiptApiServerSuccessMock!

    // MARK: - Test Lifecycle
    override func setUp() {
        sut = ReceiptDetailsViewController()
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
        XCTAssertNotNil(sut?.loadView)
    }
    
    func testViewDidLoad() {
        // When
        sut.viewDidLoad()
        // Than
        XCTAssertNotNil(sut?.viewDidLoad)
    }
    
    func testConfigureNavigation() {
        // Given
        let backButton = UIButton()
        // When
        sut.configureNavigation()
        // Than
        XCTAssertNil(sut.navigationItem.backBarButtonItem)
    }
    
    func testFetchReceiptDetails() {
        let receipt = ReceiptListModelMock.ReceiptMock.receipt
        
        apiServerMock.fetchData(completion: { I in
            XCTAssertEqual(receipt.title, "Transferência")
            XCTAssertEqual(receipt.receiptId, "4321")
            XCTAssertEqual(receipt.name, "Débora dos Santos")
            XCTAssertEqual(receipt.amount, "R$ 100,00")
            XCTAssertEqual(receipt.control, "HOGD32137821378")
            XCTAssertEqual(receipt.date, "qua, 28 de abril de 2022")
        })
    }
    
    func testFetchReceiptDetailsFailure() {
        let receipt = ReceiptListModelMock.ReceiptMock.receipt
        let apiError = ReceiptApiServerFailedMock()
        
        apiServerMock.fetchData(completion: { I in
            XCTAssertNotEqual(receipt.title, nil)
            XCTAssertNotEqual(receipt.receiptId, nil)
            XCTAssertNotEqual(receipt.name, nil)
            XCTAssertNotEqual(receipt.amount, nil)
            XCTAssertNotEqual(receipt.control, nil)
            XCTAssertNotEqual(receipt.date, nil)
        })
    }
    
}
