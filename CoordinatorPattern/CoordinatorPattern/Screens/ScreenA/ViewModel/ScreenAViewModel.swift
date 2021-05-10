//
//  LandingViewModel.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import SwiftUI
import Combine

class ScreenAViewModel: ObservableObject{
    let backAction: Action
    let screenAAction: Action

    init(
        backAction: @escaping Action = {},
        screenAAction: @escaping Action = {}
    ){
        self.backAction = backAction
        self.screenAAction = screenAAction
        print("\(#function) --> \(String(describing: self))")
    }

    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
