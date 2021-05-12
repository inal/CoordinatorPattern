//
//  SignupCoordinator.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import Foundation
import SwiftUI

class SignupCoordinator: Coordinator{

    var parentCoordinators: [BaseCoordinator] = []
    var childCoordinators: [BaseCoordinator] = []
    var router: Router 
    let signupCompletion: Action

    init(
        parent: BaseCoordinator,
        isNavigating: Binding<Bool>,
        signupCompletion: @escaping Action
    ) {
        self.parentCoordinators = parent.parentCoordinators
        self.parentCoordinators.append(parent)
        self.router = Router.init(isPresented: isNavigating)
        self.signupCompletion = signupCompletion
        print("\(#function) --> \(String(describing: self))")
    }

    func start() -> some View {
        let viewModel = SignupViewModel(
            backAction: dismiss,
            signupAction: signupCompletion
        )
        return SignupView(viewModel: viewModel, router: router)
    }
    
    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
