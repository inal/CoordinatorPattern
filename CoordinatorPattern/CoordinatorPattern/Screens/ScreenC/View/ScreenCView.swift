//
//  LoginView.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import SwiftUI

struct ScreenCView: View {
    @StateObject var viewModel: ScreenCViewModel
    @StateObject var router: Router

    var body: some View {
        VStack(spacing: 20){
            HStack{
                Button(.init(" Back"), action: {
                    viewModel.backAction()
                })
                Spacer(minLength: 89)
                Text("Screen C")
                Spacer(minLength: 60)
                Button(.init("Logout"), action: {
                    viewModel.popToLoginAction()
                })
                Spacer(minLength: 5)
            }
            Spacer()
            Text("This is final screen")
            Button(.init("Back to Root"), action: {
                viewModel.popToRootAction()
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
