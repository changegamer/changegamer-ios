//
//  HiveUtilities.swift
//  changegamer
//
//  Created by Kenan Pulak on 2/20/17.
//  Copyright © 2017 Kenan Pulak. All rights reserved.
//

import Foundation

func randomString(length:Int) -> String {
    let charSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    var c = charSet.characters.map { String($0) }
    var s:String = ""
    for _ in (1...length) {
        s.append(c[Int(arc4random()) % c.count])
    }
    return s
}

extension Date {
    var birthdayFormat: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return  formatter.string(from: self as Date)
    }
}

protocol OptionalString {}
extension String: OptionalString {}

extension Optional where Wrapped: OptionalString {
    var isNilOrEmpty: Bool {
        return ((self as? String) ?? "").isEmpty
    }
}
