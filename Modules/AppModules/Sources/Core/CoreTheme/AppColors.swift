//
//  AppColors.swift
//  AppModules
//
//  Created by Hao Tran on 25/9/25.
//

import SwiftUI

public struct AppColors: Equatable, Sendable {
    // Base
    public let brightness: ColorScheme
    public let primary: Color
    public let surfaceTint: Color
    public let onPrimary: Color
    public let primaryContainer: Color
    public let onPrimaryContainer: Color

    public let secondary: Color
    public let onSecondary: Color
    public let secondaryContainer: Color
    public let onSecondaryContainer: Color

    public let tertiary: Color
    public let onTertiary: Color
    public let tertiaryContainer: Color
    public let onTertiaryContainer: Color

    public let error: Color
    public let onError: Color
    public let errorContainer: Color
    public let onErrorContainer: Color

    public let surface: Color
    public let onSurface: Color
    public let onSurfaceVariant: Color
    public let outline: Color
    public let outlineVariant: Color
    public let shadow: Color
    public let scrim: Color
    public let inverseSurface: Color
    public let inversePrimary: Color

    // Fixed (Material 3)
    public let primaryFixed: Color
    public let onPrimaryFixed: Color
    public let primaryFixedDim: Color
    public let onPrimaryFixedVariant: Color

    public let secondaryFixed: Color
    public let onSecondaryFixed: Color
    public let secondaryFixedDim: Color
    public let onSecondaryFixedVariant: Color

    public let tertiaryFixed: Color
    public let onTertiaryFixed: Color
    public let tertiaryFixedDim: Color
    public let onTertiaryFixedVariant: Color

    // Surface containers
    public let surfaceDim: Color
    public let surfaceBright: Color
    public let surfaceContainerLowest: Color
    public let surfaceContainerLow: Color
    public let surfaceContainer: Color
    public let surfaceContainerHigh: Color
    public let surfaceContainerHighest: Color
}
