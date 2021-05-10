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
    var parentCoordinator: BaseCoordinator? = nil

    var previous: Router = .init(isPresented: .constant(false))
    var next: Router = .init(isPresented: .constant(false))

    func start() -> some View {
        switch appState {
        case .preLogin:
            return AnyView(landingCoordinator)
        case .postLogin:
            return AnyView(homeCoordinator)
        }
    }

    func update(_ state: State){
        dismiss()
        appState = state
    }

    private var landingCoordinator: some View {
        let coordinator = LandingCoordinator(parent: self)
        childCoordinators.append(coordinator)
        return coordinator.start()
    }

    private var homeCoordinator: some View {
        let coordinator = HomeCoordinator(parent: self)
        childCoordinators.append(coordinator)
        return coordinator.start()
    }
}
