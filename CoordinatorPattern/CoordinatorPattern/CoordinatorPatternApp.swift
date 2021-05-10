//
//  CoordinatorPatternApp.swift
//  CoordinatorPattern
//
//  Created by Inal Bansal on 11/5/21.
//

import SwiftUI

@main
struct CoordinatorPatternApp: App {

    @StateObject
    private var appCoordinator: AppCoordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            appCoordinator.start()
        }
    }
}
