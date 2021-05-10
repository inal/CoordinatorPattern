////
////  Coordinator.swift
////  AfterPay
////
////  Created by Inal Bansal on 30/4/21.
////

import SwiftUI

protocol BaseCoordinator: AnyObject {
    var previous: Router { get set }
    var next: Router { get set }
    var childCoordinators: [BaseCoordinator] { get set }
    var parentCoordinators: [BaseCoordinator] { get set }
    func stop()
    func dismiss()
}

protocol Coordinator: BaseCoordinator {
    associatedtype U: View
    func start() -> U
}

extension Coordinator{
    func stop(){
        // Stop All Child Coordinators
        for (_, childCoordinator) in childCoordinators.enumerated() {
            childCoordinator.stop()
        }

        // Remove self from parent's childCoordinators
        guard let parent = parentCoordinators.last else { return }
        for (index, coordinator) in parent.childCoordinators.enumerated() {
            if coordinator === self {
                parent.childCoordinators.remove(at: index)
                break
            }
        }

        // Clean up arrays
        parentCoordinators.removeAll()
        childCoordinators.removeAll()
    }

    /*
     Helper method to dismiss router and consecutive childcoordinators routers
     Make sure to dismiss self router first then rest of the children else screen will show weird transitions.
     */
    func dismiss() {
        previous.dismiss()
        for (_, childCoordinator) in childCoordinators.enumerated() {
            childCoordinator.dismiss()
        }
        stop()
    }
}
