//
//  LandingScreen.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import SwiftUI

struct LandingView: View {
    @StateObject var viewModel: LandingViewModel
    @StateObject var router: Router

    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                Text("Landing Screen\nThis is first screen")
                Spacer()
                Button(.init("Login"), action: viewModel.loginAction)
                Button(.init("Signup"), action: viewModel.signupAction)
                Spacer()
                    .navigation(router)
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
            router: Router(isPresented: .constant(false))
        )
    }
}
