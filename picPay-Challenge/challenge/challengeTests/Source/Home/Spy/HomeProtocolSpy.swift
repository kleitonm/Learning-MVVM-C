//
//  HomeProtocolSpy.swift
//  challengeTests
//
//  Created by Kleiton Mendes on 26/03/24.
//

import Foundation
@testable import challenge

final class HomeProtocolSpy {
    
    // MARK: - Public properties
    private(set) var didTappedButtonCalled = false
    
    //MARK: - Public functions
    func didTappedButton() {
        self.didTappedButtonCalled = true
    }
}
