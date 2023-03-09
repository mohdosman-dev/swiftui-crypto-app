//
//  Color.swift
//  SwiftUICrypto
//
//  Created by Mohammed Osman on 06/03/2023.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accentColor = Color("AccentColor")
    let backgroundColor = Color("BackgroundColor")
    let redColor = Color("RedColor")
    let greenColor = Color("GreenColor")
    let secondaryTextColor = Color("SecondaryTextColor")
}
