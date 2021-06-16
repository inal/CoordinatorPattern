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

    init<P: Coordinator>(
        parent: P,
        isNavigating: Binding<Bool>
    ) {
        self.router = Router.init(isPresented: isNavigating)
        self.setupParentCoordinator(parent)
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
                self.navigateToCoordinator(screenCCoordinator, router: self.router)
            }
        )
        return ScreenBView(viewModel: viewModel, router: self.router)
    }
    
    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
