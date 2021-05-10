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
    var previous = Router.init(isPresented: .constant(false))
    var next = Router.init(isPresented: .constant(false))

    weak var parentCoordinator: BaseCoordinator?
    var childCoordinators: [BaseCoordinator] = []
    
    init(parent: BaseCoordinator) {
        self.parentCoordinators = parent.parentCoordinators
        self.parentCoordinators.append(parent)
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
        return LandingView(viewModel: viewModel, previous: previous, next: next)
    }

    func navigateToLogin(){
        let loginCoordinator = LoginCoordinator(
            parent: self,
            isNavigating: self.next.isNavigating
        )
        self.childCoordinators.append(loginCoordinator)
        self.next.navigateTo(loginCoordinator.start())
    }

    func navigateToSignup(){
        let signupCoordinator = SignupCoordinator(
            parent: self,
            isNavigating: self.next.isNavigating,
            signupCompletion: {
                self.childCoordinators.filter{ $0 is SignupCoordinator}.first?.dismiss()
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                    self.navigateToLogin()
                }
            })
        self.childCoordinators.append(signupCoordinator)
        self.next.navigateTo(signupCoordinator.start())
    }

    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
