//
//  LoginView.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    @StateObject var router: Router
    @State private var name: String = ""
    @State private var password: String = ""

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
        .navigation(router)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: .init(backAction: {}, loginAction: {_,_ in }), router: .init(isPresented: .constant(false)))
    }
}
