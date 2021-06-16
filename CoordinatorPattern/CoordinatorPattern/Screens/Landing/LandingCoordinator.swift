//
//  LandingViewCoordinator.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import Foundation
import SwiftUI

class LandingCoordinator: Coordinator{
    var parentCoordinators: [BaseCoordinator] = []
    var router: Router = Router.init(isPresented: .constant(false))

    weak var parentCoordinator: BaseCoordinator?
    var childCoordinators: [BaseCoordinator] = []
    
    init<P: Coordinator>(parent: P) {
        setupParentCoordinator(parent)
        print("\(#function) --> \(String(describing: self))")
    }

    func start() -> some View {
        let viewModel = LandingViewModel(
            loginAction: {
                self.navigateToLogin()
            },
            signupAction: {
                self.navigateToSignup()
            }
        )
        return LandingView(viewModel: viewModel, router: self.router)
    }

    func navigateToLogin(){
        let loginCoordinator = LoginCoordinator(
            parent: self,
            isNavigating: self.router.isNavigating
        )
        navigateToCoordinator(loginCoordinator, router: router)
    }

    func navigateToSignup(){
        let signupCoordinator = SignupCoordinator(
            parent: self,
            isNavigating: self.router.isNavigating,
            signupCompletion: {
                self.childCoordinators.filter{ $0 is SignupCoordinator}.first?.dismiss()
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                    self.navigateToLogin()
                }
            })
        navigateToCoordinator(signupCoordinator, router: router)
    }

    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
