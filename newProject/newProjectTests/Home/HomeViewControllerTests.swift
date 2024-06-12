//
//  HomeViewControllerTests.swift
//  newProjectTests
//
//  Created by Kleiton Mendes on 11/04/24.
//

import XCTest
@testable import newProject

final class HomeViewControllerTests: XCTestCase {

    var sut: HomeViewController!
    var viewModelSpy: HomeViewModelSpy!
    var homeScreenSpy: HomeViewScreenProtocolSpy!
    
    override func setUp() {
        viewModelSpy = HomeViewModelSpy()
        sut = HomeViewController(viewModel: viewModelSpy)
        homeScreenSpy = HomeViewScreenProtocolSpy()
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        viewModelSpy = nil
        sut = nil
        homeScreenSpy =  nil
    }
    
    func test_viewDidLoad() {
        sut.viewDidLoad()
        XCTAssertEqual(sut.navigationItem.title, "Home Screen")
        XCTAssertNotNil(sut)
    }
    
    func test_loadView() {
        sut.loadView()
        XCTAssertNotNil(sut)
    }
    
    func test_tappedModalButtonCalled() {
        sut.tappedNextButton()
        XCTAssertTrue(viewModelSpy.openSecondViewCalled)
        XCTAssertEqual(viewModelSpy.openSecondViewCalledCount, 1)
    }

}

final class HomeViewScreenProtocolSpy: HomeViewScreenProtocol {
    
    private(set) var actions: SecondActions?
    private(set) var secondViewCalledCount: Int = 0
    private(set) var secondViewCalled: Bool = false
    
    func tappedNextButton() {
        secondViewCalled = true
        secondViewCalledCount += 1
    }
    
}

class HomeViewModelSpy: HomeViewModelProtocol {
    
    private(set) var openSecondViewCalled = false
    private(set) var openSecondViewCalledCount: Int = 0
    
    func openSecondView() {
        openSecondViewCalled = true
        openSecondViewCalledCount += 1
    }

}
