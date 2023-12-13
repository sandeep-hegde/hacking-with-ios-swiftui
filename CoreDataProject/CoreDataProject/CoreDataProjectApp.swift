//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Sandeep Hegde on 13/12/23.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
