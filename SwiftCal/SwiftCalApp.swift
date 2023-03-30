//
//  SwiftCalApp.swift
//  SwiftCal
//
//  Created by 이윤지 on 2023/03/30.
//

import SwiftUI

@main
struct SwiftCalApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
