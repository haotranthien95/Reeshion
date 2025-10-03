//
//  PrimaryButton.swift
//  AppModules
//
//  Created by Hao Tran on 26/9/25.
//
import SwiftUI
import CoreTheme

public struct PrimaryButton: View {
    @Environment(\.appTheme) private var theme
    let label: String
    let action: () -> Void
    
    public init(label: String, action:   @escaping @MainActor () -> Void) {
        self.label = label
        self.action = action
    }
    
    public var body: some View {
        
        Button(action:{
            action()
        }) {
            Text(label).foregroundStyle(theme.colors.onPrimary).padding(12)
        }.buttonStyle(.borderedProminent).background(theme.colors.primary).cornerRadius(32)
//            .buttonBorderShape(ButtonBorderShape.roundedRectangle).background(theme.colors.primary).padding(30).cornerRadius(16)
    }
}

#Preview {
    PrimaryButton(label: "BUTTON",action : {})
}
