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
        // inject design tokens
            .appTheme(theme)
        
        // TYPOGRAPHY (default in app scope: body)
            .environment(\.font, theme.typography.body)
        
        // COLORS (default text & accent)
            .foregroundStyle(theme.colors.onSurface)           // default text color
            .tint(theme.colors.primary)                       // default accent
        // BACKGROUND (scaffold)
            .background(theme.colors.surface.ignoresSafeArea())
        
        // NAVIGATION / TOOLBAR
            .toolbarColorScheme(colorScheme, for: .navigationBar)
            .toolbarBackground(theme.colors.surface, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        
        // LIST / SCROLL
            .scrollContentBackground(.hidden)
        
        // (Optional) List row
            .listRowBackground(theme.colors.surface)
            .listRowSeparatorTint(theme.colors.outlineVariant)
    }
}
