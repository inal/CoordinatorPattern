//
//  LoginView.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import SwiftUI

struct SignupView: View {
    @ObservedObject private var viewModel: SignupViewModel
    @ObservedObject private var router: Router
    @State private var name: String = ""
    @State private var password: String = ""

    init(viewModel: SignupViewModel,
         router: Router) {
        _viewModel = ObservedObject(wrappedValue: viewModel)
        _router = ObservedObject(wrappedValue: router)
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
        .navigation(router)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
    
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: .init(backAction: {}, loginAction: {_,_ in }), router: .init(isPresented: .constant(false)))
    }
}
