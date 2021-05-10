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
    var previous: Router
    var next: Router = .init(isPresented: .constant(false))
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
        let viewModel = LoginViewModel(
            backAction: {
                self.dismiss()
            },
            loginAction: { (name, password) in
                print("Inserted name and password is - \(name) and \(password)")
                print("This is just to demonstrate if data needs to be passed from one screen to the other. Just pass data in next screen's view model")
                (self.parentCoordinators.filter { $0 is AppCoordinator }.first as? AppCoordinator)?.update(.postLogin)
            }
        )
        return LoginView(viewModel: viewModel, previous: previous, next: next)
    }
    
    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
