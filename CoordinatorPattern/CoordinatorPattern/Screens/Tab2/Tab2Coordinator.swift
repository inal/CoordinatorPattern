//
//  Tab2Coordinator.swift
//  CoordinatorPattern
//
//  Created by Inal Personal on 16/6/21.
//

import Foundation
import SwiftUI

class Tab2Coordinator: Coordinator{

    var parentCoordinators: [BaseCoordinator] = []
    var childCoordinators: [BaseCoordinator] = []
    var router: Router = Router.init(isPresented: .constant(false))

    init<P: Coordinator>(
        parent: P
    ) {
        self.setupParentCoordinator(parent)
        print("\(#function) --> \(String(describing: self))")
    }

    func start() -> some View {
        let viewModel = Tab2ViewModel()
        return Tab2View(viewModel: viewModel)
    }
    
    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}


