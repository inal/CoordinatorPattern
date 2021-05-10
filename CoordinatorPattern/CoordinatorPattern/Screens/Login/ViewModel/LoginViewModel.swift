//
//  LandingViewModel.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject{
    let backAction: Action
    let loginAction: (String, String) -> Void

    init(
        backAction: @escaping Action = {},
        loginAction: @escaping (String, String) -> Void
    ){
        self.backAction = backAction
        self.loginAction = loginAction
        print("\(#function) --> \(String(describing: self))")
    }

    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
