////
////  Coordinator.swift
////  AfterPay
////
////  Created by Inal Bansal on 30/4/21.
////

import SwiftUI

/*
 We are creating two protocols BaseCooridnator and Coordinator:
 
 Array of type Coordinator cannot be declared inside Coordinator protocol
 due to associatedtype type and associatedtype is added to return opaque
 type View for SwiftUI views.
 
 Thus created a BaseCoordinator which is further implemented by Coordinator
 */

protocol BaseCoordinator: AnyObject {
    var childCoordinators: [BaseCoordinator] { get set }
    var parentCoordinators: [BaseCoordinator] { get set }
    var router: Router { get set }
    func stop()
    func dismiss()
}

protocol Coordinator: BaseCoordinator {
    associatedtype U: View
    func start() -> U
}

extension Coordinator {
    
    func startChildCoordinator<C: Coordinator>(_ coordinator: C) -> some View {
        childCoordinators.append(coordinator)
        return coordinator.start()
    }
    
    func navigateToCoordinator<C: Coordinator>(_ coordinator: C, router: Router) {
        childCoordinators.append(coordinator)
        router.navigateTo(coordinator.start())
    }
    
    func setupParentCoordinator<C: Coordinator>(_ coordinator: C){
        self.parentCoordinators = coordinator.parentCoordinators
        self.parentCoordinators.append(coordinator)
    }
    
    func popToIndex(_ index: Int){
        self.parentCoordinators[safe: index + 1]?.dismiss()
    }
    
    func popToCoordinator<C: Coordinator>(_ coordinatorType: C.Type){
        for (index, parentCoordinator) in parentCoordinators.enumerated() {
            if type(of: parentCoordinator.self) === coordinatorType{
                popToIndex(index)
                break
            }
        }
    }
    
    func updateAppState(_ state: AppCoordinator.State){
        (self.parentCoordinators.filter { $0 is AppCoordinator }.first as? AppCoordinator)?.update(state)
    }
    
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
        router.dismiss()
        for (_, childCoordinator) in childCoordinators.enumerated() {
            childCoordinator.dismiss()
        }
        stop()
    }
}
