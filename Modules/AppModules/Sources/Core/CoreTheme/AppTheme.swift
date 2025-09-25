//
//  AppTheme.swift
//  AppModules
//
//  Created by Hao Tran on 25/9/25.
//

import SwiftUI


public struct AppTheme: Equatable, Sendable {
    public let colors: AppColors
    public let typography: AppTypography
    
    nonisolated(unsafe) public static let `default`: AppTheme = {
        let colors = AppPalettes.darkHigh
            return AppTheme(colors: colors, typography: .default(colors: colors))
        }()
}

public struct AppThemeKey: EnvironmentKey,Sendable {
    public typealias Value = AppTheme
    public static let defaultValue: AppTheme = AppTheme.default
    
}

public struct ThemeResolver {
     static func resolve(colorScheme: ColorScheme,
                        contrast: ContrastLevel) -> AppTheme {
        let colors: AppColors
        switch (colorScheme, contrast) {
        case (.light, .high):   colors = AppPalettes.lightHigh
        case (.light, .medium): colors = AppPalettes.lightMedium   // nếu có cơ chế “medium”
        case (.light, .standard): colors = AppPalettes.light
            
        case (.dark, .high):   colors = AppPalettes.darkHigh
        case (.dark, .medium): colors = AppPalettes.darkMedium
        case (.dark, .standard): colors = AppPalettes.dark
        case (_, _): colors = AppPalettes.light
        }
        return AppTheme(colors: colors, typography: .default(colors: colors))
    }
}

public extension EnvironmentValues {
    var appTheme: AppTheme {
        get { self[AppThemeKey.self] }
        set { self[AppThemeKey.self] = newValue }
    }
}
    
extension View {
    func appTheme(_ t: AppTheme) -> some View { environment(\.appTheme, t) }
}
