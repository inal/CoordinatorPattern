//
//  LoginView.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import SwiftUI

struct ScreenCView: View {
    @StateObject private var viewModel: ScreenCViewModel
    @StateObject private var router: Router

    init(viewModel: ScreenCViewModel,
         router: Router) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _router = StateObject(wrappedValue: router)
    }

    var body: some View {
        VStack(spacing: 20){
            HStack{
                Button(.init(" Back"), action: {
                    viewModel.backAction()
                })
                Spacer()
                Text("Screen C")
                Spacer()
            }
            Spacer()
            Text("This is final screen")
            Button(.init("Back to Root"), action: {
                viewModel.popToRootAction()
            })
            Button(.init("Back to Login"), action: {
                viewModel.popToLoginAction()
            })
            Button(.init("Back to screen A"), action: {
                viewModel.popToScreenAAction()
            })
            Spacer()
        }
        .navigation(router)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct ScreenCView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenCView(viewModel: .init(backAction: {}, popToRootAction: {}, popToLoginAction: {}, popToScreenAAction: {}), router: .init(isPresented: .constant(false)))
    }
}
