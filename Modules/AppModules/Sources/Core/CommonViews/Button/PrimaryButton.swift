//
//  PrimaryButton.swift
//  AppModules
//
//  Created by Hao Tran on 26/9/25.
//
import SwiftUI

public struct PrimaryButton: View {
    let label: String
    let action: @MainActor () -> Void
    
    public init(label: String, action:   @escaping @MainActor () -> Void) {
        self.label = label
        self.action = action
    }

    public var body: some View {
        
        Button(action:action) {
            Text(label).foregroundStyle(.foreground)
        }.buttonBorderShape(ButtonBorderShape.roundedRectangle).padding(30).background(.primary).cornerRadius(16)
    }
}

#Preview {
    PrimaryButton(label: "BUTTON",action : {})
}
