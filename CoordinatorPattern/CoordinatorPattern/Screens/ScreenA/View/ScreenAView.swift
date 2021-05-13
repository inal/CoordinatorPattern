//
//  LoginView.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import SwiftUI

struct ScreenAView: View {
    @ObservedObject private var viewModel: ScreenAViewModel
    @ObservedObject private var router: Router

    init(viewModel: ScreenAViewModel,
         router: Router) {
        _viewModel = ObservedObject(wrappedValue: viewModel)
        _router = ObservedObject(wrappedValue: router)
    }
    
    var body: some View {
        VStack(spacing: 20){
            HStack(){
                Button(.init(" Back"), action: {
                    viewModel.backAction()
                })
                Spacer()
                Text("Screen A")
                Spacer()
            }
            Spacer()
            Button(.init("Go to screen B"), action: viewModel.screenAAction)
            Spacer()

        }
        .navigation(router)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct ScreenAView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenAView(viewModel: .init(backAction: {}, screenAAction: {}), router: .init(isPresented: .constant(false)))
    }
}
