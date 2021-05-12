//
//  LoginView.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import SwiftUI

struct ScreenBView: View {
    @StateObject private var viewModel: ScreenBViewModel
    @StateObject private var router: Router

    init(viewModel: ScreenBViewModel,
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
                Text("Screen B")
                Spacer()
            }
            Spacer()
            Button(.init("Go to Screen C"), action: viewModel.screenBAction)
            Spacer()
        }
        .navigation(router)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct ScreenBView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenBView(viewModel: .init(backAction: {}, screenBAction: {}), router: .init(isPresented: .constant(false)))
    }
}
