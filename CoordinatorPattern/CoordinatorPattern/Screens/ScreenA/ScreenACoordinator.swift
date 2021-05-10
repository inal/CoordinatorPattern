//
//  LandingViewCoordinator.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import Foundation
import SwiftUI

class ScreenACoordinator: Coordinator{

    var parentCoordinators: [BaseCoordinator] = []
    var childCoordinators: [BaseCoordinator] = []
    var previous: Router
    var next = Router.init(isPresented: .constant(false))
    
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
        let viewModel = ScreenAViewModel(
            backAction: {
                self.dismiss()
            },
            screenAAction: {
                let screenBCoordinator = ScreenBCoordinator(
                    parent: self,
                    isNavigating: self.next.isNavigating)
                self.childCoordinators.append(screenBCoordinator)
                self.next.navigateTo(screenBCoordinator.start())
            }
        )
        return ScreenAView(viewModel: viewModel, previous: previous, next: next)
    }

    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
