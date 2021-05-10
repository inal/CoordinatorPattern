//
//  LandingViewModel.swift
//  AfterPay
//
//  Created by Inal Bansal on 29/4/21.
//

import SwiftUI
import Combine

class SignupViewModel: ObservableObject{
    let backAction: Action
    let signupAction: Action

    init(
        backAction: @escaping Action = {},
        signupAction: @escaping Action
    ){
        self.backAction = backAction
        self.signupAction = signupAction
        print("\(#function) --> \(String(describing: self))")
    }

    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}
