//
//  LandingViewCoordinator.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import Foundation
import SwiftUI

class ScreenBCoordinator: Coordinator{

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
        let viewModel = ScreenBViewModel(
            backAction: {
                self.dismiss()
            },
            screenBAction: { [weak self] in
                guard let `self` = self else { return }
                let screenCCoordinator = ScreenCCoordinator(
                    parent: self,
                    isNavigating: self.router.isNavigating)
                self.childCoordinators.append(screenCCoordinator)
                self.router.navigateTo(screenCCoordinator.start())
            }
        )
        return ScreenBView(viewModel: viewModel, router: router)
    }
    
    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
