//
//  ContrastLevel.swift
//  AppModules
//
//  Created by Hao Tran on 25/9/25.
//


import SwiftUI

#if swift(>=5.9) // Xcode 15 / iOS 17+
typealias AppContrast = ColorSchemeContrast
#else
typealias AppContrast = AccessibilityContrast
#endif

extension Color {
    init(hex: UInt32) {
        let r = Double((hex >> 16) & 0xFF) / 255.0
        let g = Double((hex >>  8) & 0xFF) / 255.0
        let b = Double((hex >>  0) & 0xFF) / 255.0
        self = Color(.sRGB, red: r, green: g, blue: b, opacity: 1)
    }
}

enum ContrastLevel {
    case standard
    case medium
    case high
}


// Helper map về enum của bạn (standard / high)
func currentContrast(_ c: AppContrast) -> ContrastLevel {
    switch c {
    case .increased: return .high
    default:         return .standard
    }
}
