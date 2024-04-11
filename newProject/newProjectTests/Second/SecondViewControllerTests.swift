//
//  SecondViewControllerTests.swift
//  newProjectTests
//
//  Created by Kleiton Mendes on 11/04/24.
//

import XCTest
@testable import newProject

final class SecondViewControllerTests: XCTestCase {

    var sut: SecondViewController!
    var viewModelSpy: SecondViewModelSpy!
    var secondScreenSpy: SecondViewScreenProtocolSpy!
    
    override func setUp() {
        viewModelSpy = SecondViewModelSpy()
        sut = SecondViewController(viewModel: viewModelSpy)
        secondScreenSpy = SecondViewScreenProtocolSpy()
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        viewModelSpy = nil
        sut = nil
        secondScreenSpy =  nil
    }
    
    func test_viewDidLoad() {
        sut.viewDidLoad()
        XCTAssertEqual(sut.navigationItem.title, "Second Screen")
        XCTAssertNotNil(sut)
    }
    
    func test_loadView() {
        sut.loadView()
        XCTAssertNotNil(sut)
    }
    
    func test_tappedModalButtonCalled() {
        sut.tappedModalButton()
        XCTAssertTrue(viewModelSpy.openSecondViewCalled)
        XCTAssertEqual(viewModelSpy.openSecondViewCalledCount, 1)
    }

}

final class SecondViewScreenProtocolSpy: SecondViewScreenProtocol {
    
    private(set) var actions: SecondActions?
    private(set) var secondViewCalledCount: Int = 0
    private(set) var secondViewCalled: Bool = false
    
    func tappedModalButton() {
        secondViewCalled = true
        secondViewCalledCount += 1
    }
    
}

class SecondViewModelSpy: SecondViewModelProtocol {
    private(set) var openSecondViewCalled = false
    private(set) var openSecondViewCalledCount: Int = 0

    func openModalView() {
        openSecondViewCalled = true
        openSecondViewCalledCount += 1
    }

}
