//
//  Router.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import SwiftUI

class Router: ObservableObject {
    
    struct State {
        var navigating: AnyView? = nil
        var isPresented: Binding<Bool>
    }
    
    @Published private(set) var state: State
    
    init(isPresented: Binding<Bool>) {
        state = State(isPresented: isPresented)
    }
    
    func navigateTo<V: View>(_ view: V) {
        state.navigating = AnyView(view)
    }
    
    func dismiss() {
        state.isPresented.wrappedValue = false
    }
    
    var isNavigating: Binding<Bool> {
        boolBinding(keyPath: \.navigating)
    }
    
    var isPresented: Binding<Bool> {
        state.isPresented
    }
    
    func binding<T>(keyPath: WritableKeyPath<State, T>) -> Binding<T> {
        Binding(
            get: { self.state[keyPath: keyPath] },
            set: { self.state[keyPath: keyPath] = $0 }
        )
    }
    
    func boolBinding<T>(keyPath: WritableKeyPath<State, T?>) -> Binding<Bool> {
        Binding(
            get: { self.state[keyPath: keyPath] != nil },
            set: {
                if !$0 {
                    self.state[keyPath: keyPath] = nil
                }
            }
        )
    }
}
