//
//  ModalFactory.swift
//  newProject
//
//  Created by Kleiton Mendes on 06/04/24.
//

import UIKit

enum ModalFactory {
    
    static func make() -> UIViewController {
        let controller = ModalViewController()
        return controller
    }
}
