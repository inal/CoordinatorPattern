//
//  LandingViewCoordinator.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import Foundation
import SwiftUI

class HomeCoordinator: Coordinator{
    var router: Router = Router.init(isPresented: .constant(false))
    var parentCoordinators: [BaseCoordinator] = []
    var childCoordinators: [BaseCoordinator] = []
    
    init<P: Coordinator>(parent: P) {
        setupParentCoordinator(parent)
        print("\(#function) --> \(String(describing: self))")
    }

    func start() -> some View {
        let viewModel = HomeViewModel { (tab) -> AnyView in
            switch tab{
            case .tab1: return AnyView(Tab1Coordinator(parent: self).start())
            case .tab2: return AnyView(Tab2Coordinator(parent: self).start())
            }
        }
        return HomeView(viewModel: viewModel, router: self.router)
    }

    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
