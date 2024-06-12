//
//  HomeViewModelTests.swift
//  newProjectTests
//
//  Created by Kleiton Mendes on 10/04/24.
//

import XCTest
@testable import newProject

final class HomeViewModelTests: XCTestCase {
    
    var coordinatorSpy2: CoordinatorSpy!
    lazy var sut2: HomeViewModel = {
        let sut = HomeViewModel(coordinator: coordinatorSpy2)
        return sut
    }()
    
    var sut: HomeViewModel!
    var coordinatorSpy: CoordinatorSpy!
    var navigation: UINavigationController!
    var viewModelSpy: HomeViewModelProtocolSpy!
    
    override func setUp() {
        viewModelSpy = HomeViewModelProtocolSpy()
        navigation = UINavigationController()
        coordinatorSpy = CoordinatorSpy()
        sut = HomeViewModel(coordinator: coordinatorSpy)
    }
    
    override func tearDown() {
        viewModelSpy = nil
        navigation = nil
        coordinatorSpy = nil
        sut = nil
    }
    
    func test_openSecondView() {
        sut.openSecondView()
        
        XCTAssertTrue(coordinatorSpy.navigateCalled)
        XCTAssertEqual(coordinatorSpy.navigateCalledCount, 1)
        XCTAssertEqual(coordinatorSpy.actions, .second)
    }

}


class HomeViewModelProtocolSpy: HomeViewModelProtocol {
    
    var openSecondViewCalled = false
    
    func openSecondView() {
        openSecondViewCalled = true
    }
    
}

final class CoordinatorSpy: HomeCoordinatorProtocol {
    
    private(set) var actions: HomeActions?
    private(set) var navigateCalledCount: Int = 0
    private(set) var navigateCalled: Bool = false
    
    func navigate(to view: newProject.HomeActions) {
        navigateCalled = true
        navigateCalledCount += 1
        actions = view
    }
    
}
