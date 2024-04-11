//
//  SecondViewModelTests.swift
//  newProjectTests
//
//  Created by Kleiton Mendes on 11/04/24.
//

import XCTest
@testable import newProject

final class SecondViewModelTests: XCTestCase {
    
    var sut: SecondViewModel!
    var coordinatorSpy: SecondCoordinatorSpy!
    var navigation: UINavigationController!
    var viewModelSpy: SecondViewModelProtocolSpy!
    
    override func setUp() {
        viewModelSpy = SecondViewModelProtocolSpy()
        navigation = UINavigationController()
        coordinatorSpy = SecondCoordinatorSpy()
        sut = SecondViewModel(coordinator: coordinatorSpy)
    }
    
    override func tearDown() {
        viewModelSpy = nil
        navigation = nil
        coordinatorSpy = nil
        sut = nil
    }
    
    func test_openSecondView() {
        sut.openModalView()
        
        XCTAssertTrue(coordinatorSpy.navigateCalled)
        XCTAssertEqual(coordinatorSpy.navigateCalledCount, 1)
        XCTAssertEqual(coordinatorSpy.actions, .modal)
    }

}


class SecondViewModelProtocolSpy: SecondViewModelProtocol {
    private(set) var openSecondViewCalled = false
    private(set) var openSecondViewCalledCount: Int = 0

    func openModalView() {
        openSecondViewCalled = true
        openSecondViewCalledCount += 1
    }

}

final class SecondCoordinatorSpy: SecondCoordinatorProtocol {
    
    private(set) var actions: SecondActions?
    private(set) var navigateCalledCount: Int = 0
    private(set) var navigateCalled: Bool = false
    
    func navigate(to view: newProject.SecondActions) {
        navigateCalled = true
        navigateCalledCount += 1
        actions = view
    }
    
}
