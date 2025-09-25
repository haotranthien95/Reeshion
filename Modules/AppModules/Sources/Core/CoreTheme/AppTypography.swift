//
//  AppTypography.swift
//  AppModules
//
//  Created by Hao Tran on 25/9/25.
//

import SwiftUI

public struct AppTypography: Equatable, Sendable {
    // Bạn có thể map sang Material-like scale nếu muốn
    let displayLarge: Font
    let title: Font
    let headline: Font
    let body: Font
    let label: Font
    let caption: Font

    static func `default`(colors: AppColors) -> AppTypography {
        // Dynamic Type + weight; Material thường đặt text màu = onSurface
        // Màu chữ sẽ apply qua .foregroundStyle ở ThemeContainer
        .init(
            displayLarge: .system(.largeTitle, design: .rounded).weight(.bold),
            title:       .system(.title2, design: .rounded).weight(.semibold),
            headline:    .system(.headline, design: .rounded),
            body:        .system(.body),
            label:       .system(.subheadline),
            caption:     .system(.caption)
        )
    }
}
