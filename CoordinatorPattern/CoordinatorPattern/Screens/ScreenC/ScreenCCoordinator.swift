//
//  LandingViewCoordinator.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import Foundation
import SwiftUI

class ScreenCCoordinator: Coordinator{

    var parentCoordinators: [BaseCoordinator] = []
    var childCoordinators: [BaseCoordinator] = []
    var previous: Router
    var next = Router.init(isPresented: .constant(false))
    
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
        let viewModel = ScreenCViewModel(
            backAction: dismiss,
            popToRootAction: {
                self.parentCoordinators.filter { $0 is HomeCoordinator }.first?.dismiss()
            },
            popToLoginAction: {
                (self.parentCoordinators.filter { $0 is AppCoordinator }.first as? AppCoordinator)?.update(.preLogin)
            },
            popToScreenAAction: {
                self.parentCoordinators.filter { $0 is ScreenACoordinator }.first?.dismiss()
            }
        )
        return ScreenCView(viewModel: viewModel, router: previous)
    }

    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
