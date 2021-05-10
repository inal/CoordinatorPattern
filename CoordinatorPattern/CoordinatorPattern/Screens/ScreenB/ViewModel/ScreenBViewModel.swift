//
//  LandingViewModel.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import SwiftUI
import Combine

class ScreenBViewModel: ObservableObject{
    let backAction: Action
    let screenBAction: Action

    init(
        backAction: @escaping Action = {},
        screenBAction: @escaping Action = {}
    ){
        self.backAction = backAction
        self.screenBAction = screenBAction
        print("\(#function) --> \(String(describing: self))")
    }

    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
