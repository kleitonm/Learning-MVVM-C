//
//  SecondScreenFactory.swift
//  newProject
//
//  Created by Kleiton Mendes on 06/04/24.
//

import UIKit

enum SecondFactory {
    
    static func make() -> UIViewController {
        let controller = SecondViewController()
        return controller
    }
}
