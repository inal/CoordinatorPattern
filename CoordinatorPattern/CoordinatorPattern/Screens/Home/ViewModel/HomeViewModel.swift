//
//  LandingViewModel.swift
//  AfterPay
//
//  Created byInal Bansal on 29/4/21.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject{
    let tab1Action: Action
    let tab2Action: Action

    init(
        tab1Action: @escaping Action,
        tab2Action: @escaping Action
    ){
        self.tab1Action = tab1Action
        self.tab2Action = tab2Action
        print("\(#function) --> \(String(describing: self))")
    }

    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
