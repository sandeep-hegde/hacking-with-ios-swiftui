//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Sandeep Hegde on 13/12/23.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
