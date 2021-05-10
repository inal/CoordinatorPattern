//
//  LoginView.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import SwiftUI

struct ScreenAView: View {
    @StateObject private var viewModel: ScreenAViewModel
    @StateObject private var previous: Router
    @StateObject private var next: Router

    init(viewModel: ScreenAViewModel,
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
                Text("Screen A")
                Spacer()
            }
            Spacer()
            Button(.init("Go to screen B"), action: viewModel.screenAAction)
            Spacer()

        }
        .navigation(previous)
        .navigation(next)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct ScreenAView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenAView(viewModel: .init(backAction: {}, screenAAction: {}), previous: .init(isPresented: .constant(false)), next: .init(isPresented: .constant(false)))
    }
}
