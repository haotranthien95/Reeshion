//
//  ReeshionApp.swift
//  Reeshion
//
//  Created by Hao Tran on 30/8/25.
//

import SwiftUI

@main
struct ReeshionApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
