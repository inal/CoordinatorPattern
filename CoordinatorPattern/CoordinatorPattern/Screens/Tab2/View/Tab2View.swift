//
//  Tab2View.swift
//  CoordinatorPattern
//
//  Created by Inal Personal on 16/6/21.
//

import SwiftUI

struct Tab2View: View {
    @StateObject var viewModel: Tab2ViewModel

    var body: some View {
        Spacer()
        Text("Tab 2")
        Spacer()
    }
}

struct Tab2View_Previews: PreviewProvider {
    static var previews: some View {
        Tab2View(viewModel: .init())
    }
}
