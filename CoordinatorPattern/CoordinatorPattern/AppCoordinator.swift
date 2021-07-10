//
//  AppCoordinator.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import SwiftUI

class AppCoordinator: Coordinator, ObservableObject{

    enum State {
        case preLogin
        case postLogin
    }

    @Published var appState: State = .preLogin
    
    var parentCoordinators: [BaseCoordinator] = []
    var childCoordinators: [BaseCoordinator] = []

    var router: Router = .init(isPresented: .constant(false))

    @ViewBuilder
    func start() -> some View {
        switch appState {
        case .preLogin:
            landingCoordinator
        case .postLogin:
            homeCoordinator
        }
    }

    func update(_ state: State){
        dismiss()
        appState = state
    }

    private var landingCoordinator: some View {
        startChildCoordinator(LandingCoordinator(parent: self))
    }

    private var homeCoordinator: some View {
        startChildCoordinator(HomeCoordinator(parent: self))
    }
}
