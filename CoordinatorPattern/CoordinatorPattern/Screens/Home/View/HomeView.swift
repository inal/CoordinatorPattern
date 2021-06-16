//
//  LandingScreen.swift
//  AfterPay
//
//  Created by Inal Bansalon 29/4/21.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    @StateObject var router: Router
    @State var selectedView = 1

    var body: some View {
        currentContent
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        tabBar
            .padding(.vertical, 16)
            .padding(.horizontal, 24)
        
    }
    
    private var currentContent: some View{
        viewModel.selectedTabView
    }
    
    private var tabBar: some View{
        HStack{
            tab1Item
            tab2Item
        }
    }
    
    private var tab1Item: some View{
        Button(
            .init("Tab 1"),
            action: viewModel.tab1buttonTapped
        )
        .frame(maxWidth: .infinity)
        .background(viewModel.selectedTab == .tab1 ? Color.red : Color.clear)
    }
    
    private var tab2Item: some View{
        Button(
            .init("Tab 2"),
            action: viewModel.tab2buttonTapped
        )
        .frame(maxWidth: .infinity)
        .background(viewModel.selectedTab == .tab2 ? Color.red : Color.clear)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            viewModel: HomeViewModel(tabSelectedAction: { (_) -> AnyView in
                AnyView(EmptyView())
            }),
            router: Router(isPresented: .constant(false))
        )
    }
}
