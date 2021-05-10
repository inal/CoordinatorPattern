//
//  NavigationViewModifier.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import SwiftUI

struct NavigationViewModifier: ViewModifier {

    @Binding var presentingView: AnyView?

    func body(content: Content) -> some View {
        content
            .background(
                NavigationLink(destination: self.presentingView, isActive: Binding(
                    get: { self.presentingView != nil },
                    set: { if !$0 {
                        self.presentingView = nil
                    }})
                ) {
                    EmptyView()
                }
            )
    }
}

extension View {
    func navigation(_ router: Router) -> some View {
        self.modifier(NavigationViewModifier(presentingView: router.binding(keyPath: \.navigating)))
    }
}
