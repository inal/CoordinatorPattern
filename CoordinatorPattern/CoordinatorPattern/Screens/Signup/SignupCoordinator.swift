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
    var previous: Router
    var next: Router = .init(isPresented: .constant(false))
    let signupCompletion: Action

    init(
        parent: BaseCoordinator,
        isNavigating: Binding<Bool>,
        signupCompletion: @escaping Action
    ) {
        self.parentCoordinators = parent.parentCoordinators
        self.parentCoordinators.append(parent)
        self.previous = Router.init(isPresented: isNavigating)
        self.signupCompletion = signupCompletion
        print("\(#function) --> \(String(describing: self))")
    }

    func start() -> some View {
        let viewModel = SignupViewModel(
            backAction: dismiss,
            signupAction: signupCompletion
        )
        return SignupView(viewModel: viewModel, previous: previous, next: next)
    }
    
    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
