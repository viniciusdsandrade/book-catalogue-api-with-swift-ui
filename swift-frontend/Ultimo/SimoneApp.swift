//
//  UltimoApp.swift
//  Ultimo
//
//  Created by VITOR DE SOUZA NASCIMENTO on 04/11/24.
//

import SwiftUI

@main
struct UltimoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
