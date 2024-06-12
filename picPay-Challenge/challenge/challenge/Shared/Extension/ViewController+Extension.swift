//
//  ViewController+Extension.swift
//  challenge
//
//  Created by Kleiton Mendes on 25/03/24.
//

import UIKit

extension UIViewController {
    
    func createLeftBarButton(action: Selector) -> UIBarButtonItem {
        let button = UIButton()
        button.setImage(
            UIImage(systemName: "chevron.backward"),
            for: .normal
        )
        button.tintColor = .orange
        button.imageView?.contentMode =
            .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: action, for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: button)
        return menuBarItem
    }
    
}
