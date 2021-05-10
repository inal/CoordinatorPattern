//
//  LoginView.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel
    @StateObject private var previous: Router
    @StateObject private var next: Router
    @State private var name: String = ""
    @State private var password: String = ""

    init(viewModel: LoginViewModel,
         previous: Router,
         next: Router) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _previous = StateObject(wrappedValue: previous)
        _next = StateObject(wrappedValue: next)
    }

    var body: some View {
        VStack(spacing: 20){
            HStack(){
                Button(.init(" Back"), action: {
                    viewModel.backAction()
                })
                Spacer()
                Text("Login Scren")
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
            Button("Login") {
                viewModel.loginAction(name, password)
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: .init(backAction: {}, loginAction: {_,_ in }), previous: .init(isPresented: .constant(false)), next: .init(isPresented: .constant(false)))
    }
}
