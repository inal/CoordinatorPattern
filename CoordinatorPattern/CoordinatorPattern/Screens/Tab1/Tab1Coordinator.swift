//
//  Tab1Coordinator.swift
//  CoordinatorPattern
//
//  Created by Inal Personal on 16/6/21.
//

import Foundation
import SwiftUI

class Tab1Coordinator: Coordinator{

    var parentCoordinators: [BaseCoordinator] = []
    var childCoordinators: [BaseCoordinator] = []
    var router: Router = Router.init(isPresented: .constant(false))

    init<P: Coordinator>(
        parent: P
    ) {
        self.setupParentCoordinator(parent)
        print("\(#function) --> \(String(describing: self))")
    }

    func start() -> some View {
        let viewModel = Tab1ViewModel(
            logoutAction: { [weak self] in
                guard let `self` = self else { return }
                self.updateAppState(.preLogin)
            },
            nextScreenAction: { [weak self] in
                guard let `self` = self else { return }
                let coordinator = ScreenACoordinator(
                    parent: self,
                    isNavigating: self.router.isNavigating)
                self.navigateToCoordinator(
                    coordinator,
                    router: self.router
                )
            }
        )
        return Tab1View(viewModel: viewModel, router: self.router)
    }
    
    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}

