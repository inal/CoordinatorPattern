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

    init<P: Coordinator>(
        parent: P,
        isNavigating: Binding<Bool>,
        signupCompletion: @escaping Action
    ) {
        self.router = Router.init(isPresented: isNavigating)
        self.signupCompletion = signupCompletion
        setupParentCoordinator(parent)
        
        print("\(#function) --> \(String(describing: self))")
    }

    func start() -> some View {
        let viewModel = SignupViewModel(
            backAction: dismiss,
            signupAction: signupCompletion
        )
        return SignupView(viewModel: viewModel, router: self.router)
    }
    
    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
