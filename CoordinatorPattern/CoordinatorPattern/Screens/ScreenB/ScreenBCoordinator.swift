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
    var previous: Router
    var next: Router = Router.init(isPresented: .constant(false))

    init(
        parent: BaseCoordinator,
        isNavigating: Binding<Bool>
    ) {
        self.parentCoordinators = parent.parentCoordinators
        self.parentCoordinators.append(parent)
        self.previous = Router.init(isPresented: isNavigating)
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
                    isNavigating: self.next.isNavigating)
                self.childCoordinators.append(screenCCoordinator)
                self.next.navigateTo(screenCCoordinator.start())
            }
        )
        return ScreenBView(viewModel: viewModel, router: previous, currentRouter: next)
    }
    
    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
