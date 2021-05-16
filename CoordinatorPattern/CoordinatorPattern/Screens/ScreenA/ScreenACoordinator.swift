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
    
    init<P: Coordinator>(
        parent: P,
        isNavigating: Binding<Bool>
    ) {
        self.router = Router.init(isPresented: isNavigating)
        setupParentCoordinator(parent)
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
                self.navigateToCoordinator(screenBCoordinator, router: self.router)
            }
        )
        return ScreenAView(viewModel: viewModel, router: router)
    }

    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
