//
//  LandingViewModel.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import SwiftUI
import Combine

class LandingViewModel: ObservableObject{
    let loginAction: Action
    let signupAction: Action

    init(
        loginAction: @escaping Action,
        signupAction: @escaping Action
    ){
        self.loginAction = loginAction
        self.signupAction = signupAction
        print("\(#function) --> \(String(describing: self))")
    }

    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
