//
//  Int Helper.swift
//  Custom Cell with XIB
//
//  Created by Afina R. Vinci on 10/05/22.
//

import Foundation

extension Int {
    public func makeRupiah() -> String {
        let formatter = NumberFormatter()
        formatter.positivePrefix = "Rp "
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "id_ID")
        let numberValue = NSNumber(value: self)
        return formatter.string(from: numberValue)!
    }
    
    public func splitThousands() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "id_ID")
        let numberValue = NSNumber(value: self)
        return formatter.string(from: numberValue)!
    }
}
