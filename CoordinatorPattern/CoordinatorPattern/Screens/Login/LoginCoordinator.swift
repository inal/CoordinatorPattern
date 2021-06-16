//
//  LandingViewCoordinator.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import Foundation
import SwiftUI

class LoginCoordinator: Coordinator{
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
        let viewModel = LoginViewModel(
            backAction: {
                self.dismiss()
            },
            loginAction: { (name, password) in
                print("Inserted name and password is - \(name) and \(password)")
                print("This is just to demonstrate if data needs to be passed from one screen to the other. Just pass data in next screen's view model")
                self.updateAppState(.postLogin)
            }
        )
        return LoginView(viewModel: viewModel, router: self.router)
    }
    
    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
