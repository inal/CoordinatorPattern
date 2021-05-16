//
//  LandingViewCoordinator.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import Foundation
import SwiftUI

class HomeCoordinator: Coordinator{
    var router: Router = Router.init(isPresented: .constant(false))
    var parentCoordinators: [BaseCoordinator] = []
    var childCoordinators: [BaseCoordinator] = []
    
    init<P: Coordinator>(parent: P) {
        setupParentCoordinator(parent)
        print("\(#function) --> \(String(describing: self))")
    }

    func start() -> some View {
        let viewModel = HomeViewModel(
            tab1Action: {
                self.navigateToScreenA()
            },
            tab2Action: {}
        )
        return HomeView(viewModel: viewModel, router: router)
    }

    func navigateToScreenA(){
        let coordinator = ScreenACoordinator(
            parent: self,
            isNavigating: self.router.isNavigating
        )
        self.navigateToCoordinator(coordinator, router: self.router)
    }

    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
