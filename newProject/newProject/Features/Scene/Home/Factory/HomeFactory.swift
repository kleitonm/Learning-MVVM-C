//
//  HomeFactory.swift
//  newProject
//
//  Created by Kleiton Mendes on 29/03/24.
//

import UIKit

enum HomeFactory {
    
    static func make() -> UIViewController {
        let controller = HomeViewController()
        return controller
    }
}
