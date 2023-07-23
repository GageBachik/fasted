//
//  fastedApp.swift
//  fasted
//
//  Created by Gage Bachik on 7/22/23.
//

import SwiftUI

@main
struct fastedApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
