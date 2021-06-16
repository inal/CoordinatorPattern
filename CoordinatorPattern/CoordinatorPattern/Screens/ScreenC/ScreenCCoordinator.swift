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
        let viewModel = ScreenCViewModel(
            backAction: dismiss,
            popToRootAction: popToHome,
            popToLoginAction: {
                self.updateAppState(.preLogin)
            },
            popToScreenAAction: popToScreenA
        )
        return ScreenCView(viewModel: viewModel, router: self.router)
    }
    
    func popToHome(){
        popToCoordinator(Tab1Coordinator.self)
    }
    
    func popToScreenA(){
        popToCoordinator(ScreenACoordinator.self)
    }

    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
