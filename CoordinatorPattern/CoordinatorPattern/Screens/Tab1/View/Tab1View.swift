//
//  Tab1View.swift
//  CoordinatorPattern
//
//  Created by Inal Personal on 16/6/21.
//

import SwiftUI

struct Tab1View: View {
    @StateObject var viewModel: Tab1ViewModel
    @StateObject var router: Router

    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                HStack{
                    Spacer(minLength: 5)
                    Button(.init("Logout"), action: {
                        viewModel.logoutAction()
                    })
                    Spacer(minLength: 60)
                    Text("Tab 1")
                    Spacer(minLength: 130)
                }
                Spacer()
                Button(.init("Go to Screen A"), action: viewModel.nextScreenAction)
                Spacer()
            }
            .navigation(router)
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Tab1View_Previews: PreviewProvider {
    static var previews: some View {
        Tab1View(viewModel: .init(logoutAction: {}, nextScreenAction: {}), router: .init(isPresented: .constant(false)))
    }
}
