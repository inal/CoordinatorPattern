//
//  LandingViewCoordinator.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import Foundation
import SwiftUI

class ScreenACoordinator: Coordinator{

    var parentCoordinators: [BaseCoordinator] = []
    var childCoordinators: [BaseCoordinator] = []
    var router: Router
    
    init(
        parent: BaseCoordinator,
        isNavigating: Binding<Bool>
    ) {
        self.parentCoordinators = parent.parentCoordinators
        self.parentCoordinators.append(parent)
        self.router = Router.init(isPresented: isNavigating)
        print("\(#function) --> \(String(describing: self))")
    }

    func start() -> some View {
        let viewModel = ScreenAViewModel(
            backAction: {
                self.dismiss()
            },
            screenAAction: {
                let screenBCoordinator = ScreenBCoordinator(
                    parent: self,
                    isNavigating: self.router.isNavigating)
                self.childCoordinators.append(screenBCoordinator)
                self.router.navigateTo(screenBCoordinator.start())
            }
        )
        return ScreenAView(viewModel: viewModel, router: router)
    }

    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
