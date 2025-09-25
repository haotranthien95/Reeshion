//
//  AppThemeKey.swift
//  AppModules
//
//  Created by Hao Tran on 25/9/25.
//

import SwiftUI

public struct ThemeContainer<Content: View>: View {
    @Environment(\.colorScheme) private var colorScheme

    #if swift(>=5.9)
    @Environment(\.colorSchemeContrast) private var contrast // iOS 17+
    #else
    @Environment(\.accessibilityContrast) private var contrast // iOS 16-
    #endif

    private let content: () -> Content

    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    public var body: some View {
        let theme = ThemeResolver.resolve(
            colorScheme: colorScheme,
            contrast: currentContrast(contrast)
        )

        content()
            .appTheme(theme)
            .foregroundStyle(theme.colors.onSurface)
            .tint(theme.colors.primary)
            .background(theme.colors.surface.ignoresSafeArea())
    }
}
