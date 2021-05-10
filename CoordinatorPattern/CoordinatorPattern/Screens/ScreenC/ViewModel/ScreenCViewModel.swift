//
//  LandingViewModel.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import SwiftUI
import Combine

class ScreenCViewModel: ObservableObject{
    let backAction: Action
    let popToRootAction: Action
    let popToLoginAction: Action
    let popToScreenAAction: Action

    init(
        backAction: @escaping Action,
        popToRootAction: @escaping Action,
        popToLoginAction: @escaping Action,
        popToScreenAAction: @escaping Action
    ){
        self.backAction = backAction
        self.popToRootAction = popToRootAction
        self.popToLoginAction = popToLoginAction
        self.popToScreenAAction = popToScreenAAction
        print("\(#function) --> \(String(describing: self))")
    }

    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
