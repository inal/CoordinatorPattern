//
//  Tab1ViewModel.swift
//  CoordinatorPattern
//
//  Created by Inal Personal on 16/6/21.
//

import SwiftUI

class Tab1ViewModel: ObservableObject{
    let logoutAction: Action
    let nextScreenAction: Action

    init(
        logoutAction: @escaping Action = {},
        nextScreenAction: @escaping Action = {}
    ){
        self.logoutAction = logoutAction
        self.nextScreenAction = nextScreenAction
        print("\(#function) --> \(String(describing: self))")
    }

    deinit {
        print("\(#function) --> \(String(describing: self))")
    }
}

