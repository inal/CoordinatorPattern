//
//  LandingScreen.swift
//  AfterPay
//
//  Created by Inal Bansalon 29/4/21.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel
    @StateObject private var previous: Router
    @StateObject private var next: Router
    @State var selectedView = 1

    init(
        viewModel: HomeViewModel,
        previous: Router,
        next: Router
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _previous = StateObject(wrappedValue: previous)
        _next = StateObject(wrappedValue: next)
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
            .navigation(previous)
            .navigation(next)
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
            previous: Router(isPresented: .constant(false)),
            next: Router(isPresented: .constant(false))
        )
    }
}
