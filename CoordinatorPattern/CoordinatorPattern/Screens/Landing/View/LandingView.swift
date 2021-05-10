//
//  LandingScreen.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import SwiftUI

struct LandingView: View {
    @StateObject private var viewModel: LandingViewModel
    @StateObject private var previous: Router
    @StateObject private var next: Router

    init(viewModel: LandingViewModel,
         previous: Router,
         next: Router
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _previous = StateObject(wrappedValue: previous)
        _next = StateObject(wrappedValue: next)
    }

    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                Text("Landing Screen\nThis is first screen")
                Spacer()
                Button(.init("Login"), action: viewModel.loginAction)
                Button(.init("Signup"), action: viewModel.signupAction)
                Spacer()
                    .navigation(previous)
                    .navigation(next)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct LandingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LandingView(
            viewModel: LandingViewModel(
                loginAction: {},
                signupAction: {}
            ),
            previous: Router(isPresented: .constant(false)),
            next: Router(isPresented: .constant(false))
        )
    }
}
