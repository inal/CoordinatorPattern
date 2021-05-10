//
//  LoginView.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import SwiftUI

struct SignupView: View {
    @StateObject private var viewModel: SignupViewModel
    @StateObject private var previous: Router
    @StateObject private var next: Router
    @State private var name: String = ""
    @State private var password: String = ""

    init(viewModel: SignupViewModel,
         previous: Router,
         next: Router) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _previous = StateObject(wrappedValue: previous)
        _next = StateObject(wrappedValue: next)
    }

    var body: some View {
        VStack(spacing: 20){
            HStack(){
                Button(.init("Back"), action: {
                    viewModel.backAction()
                })
                Spacer()
                Text("Signup Scren")
                Spacer()
                Spacer()
            }
            Spacer()
            TextField("Enter your name", text: $name)
                .padding([.leading, .trailing], 20)
                .padding([.top, .bottom], 10)
            TextField("Enter your password", text: $password)
                .padding([.leading, .trailing], 20)
                .padding([.top, .bottom], 10)
            Button("Signup") {
                viewModel.signupAction()
            }
            Spacer()
            Spacer()
        }
        .navigation(previous)
        .navigation(next)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
    
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: .init(backAction: {}, loginAction: {_,_ in }), previous: .init(isPresented: .constant(false)), next: .init(isPresented: .constant(false)))
    }
}
