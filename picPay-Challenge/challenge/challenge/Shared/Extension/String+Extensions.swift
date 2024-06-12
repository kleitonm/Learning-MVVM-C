//
//  String+.swift
//  challenge
//
//  Created by Kleiton Mendes on 26/03/24.
//

import Foundation

extension String {
    func removingAccents() -> String {
        let mutableString = NSMutableString(string: self) as CFMutableString
        CFStringTransform(mutableString, nil, kCFStringTransformStripCombiningMarks, false)
        return mutableString as String
    }
    
    func removingPunctuation() -> String {
        return self.filter { !$0.isPunctuation }
    }
}
