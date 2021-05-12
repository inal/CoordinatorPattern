//
//  LandingScreen.swift
//  AfterPay
//
//  Created by Inal Bansalon 29/4/21.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel
    @StateObject private var router: Router
    @State var selectedView = 1

    init(
        viewModel: HomeViewModel,
        router: Router
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _router = StateObject(wrappedValue: router)
    }

    var body: some View {
        TabView(selection: $selectedView) {
            tab1

            Text("2")
            .padding()
            .tabItem {
                Label("Second", systemImage: "2.circle")
            }
            .tag(2)
        }
    }

    var tab1: some View{
        NavigationView{
            VStack{
                Text("Tab 1")
                Spacer()
                Button("Start process"){
                    viewModel.tab1Action()
                }
                Spacer()
            }
            .navigation(router)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .padding()
        .tabItem {
            Label("First", systemImage: "1.circle")
        }
        .tag(1)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            viewModel: HomeViewModel(
                tab1Action: {},
                tab2Action: {}
            ),
            router: Router(isPresented: .constant(false))
        )
    }
}
