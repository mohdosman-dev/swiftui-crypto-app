//
//  Double.swift
//  SwiftUICrypto
//
//  Created by Mohammed Osman on 07/03/2023.
//

import Foundation

extension Double {
    
    /// Convert a Double to Currency with 2-6 digits
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// Convert 12.3456 to $12.3456
    /// Convert 0.123456 to $0.123456
    /// ```
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        formatter.currencyCode = "usd"
        formatter.locale = .current
        
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    /// Convert a Double to Currency as String with 2-6 digits
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// Convert 12.3456 to "$12.3456"
    /// Convert 0.1234567 to "$0.123457"
    /// ```
    func asCurrency() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter.string(from: number) ?? "$0.00"
    }
    
    /// Convert a Double into string presentation
    /// ```
    /// Convert 1.234 to "1.23"
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    /// Convert a Double into string presentation with pecent symbol
    /// ```
    /// Convert 1.234 to "1.23%"
    /// ```
    func asPercentString() -> String {
        return String(format: "%.2f", self) + "%"
    }
}
