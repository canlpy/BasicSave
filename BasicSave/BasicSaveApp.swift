//
//  BasicSaveApp.swift
//  BasicSave
//
//  Created by Can on 27.07.2022.
//

import SwiftUI

@main
struct BasicSaveApp: App {
    @StateObject private var dataController = DataController()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
