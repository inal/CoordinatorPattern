//
//  LandingViewModel.swift
//  AfterPay
//
//  Created byInal Bansal on 29/4/21.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject{
    
    enum Tab{
        case tab1
        case tab2
    }
    
    @Published private(set) var selectedTab: Tab = .tab1
    
    private var tabSelectedAction: (Tab)-> AnyView
    
    init(
        tabSelectedAction: @escaping (Tab)-> AnyView
    ){
        self.tabSelectedAction = tabSelectedAction
        print("\(#function) --> \(String(describing: self))")
    }
    
    func tab1buttonTapped(){
        selectedTab = .tab1
    }
    
    func tab2buttonTapped(){
        selectedTab = .tab2
    }
    
    var selectedTabView: some View{
        tabSelectedAction(selectedTab)
    }

    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
