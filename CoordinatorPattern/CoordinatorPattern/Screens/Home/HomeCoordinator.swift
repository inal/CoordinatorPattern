//
//  LandingViewCoordinator.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import Foundation
import SwiftUI

class HomeCoordinator: Coordinator{
    var previous: Router = Router.init(isPresented: .constant(false))
    var next: Router = Router.init(isPresented: .constant(false))
    var parentCoordinators: [BaseCoordinator] = []
    var childCoordinators: [BaseCoordinator] = []
    
    init(parent: BaseCoordinator) {
        self.parentCoordinators = parent.parentCoordinators
        self.parentCoordinators.append(parent)
        print("\(#function) --> \(String(describing: self))")
    }

    func start() -> some View {
        let viewModel = HomeViewModel(
            tab1Action: {
                self.navigateToScreenA()
            },
            tab2Action: {}
        )
        return HomeView(viewModel: viewModel, previous: previous, next: next)
    }

    func navigateToScreenA(){
        let coordinator = ScreenACoordinator(
            parent: self,
            isNavigating: self.next.isNavigating
        )
        self.childCoordinators.append(coordinator)
        self.next.navigateTo(coordinator.start())
    }

    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
