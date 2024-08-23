//
//  MyCalcApp.swift
//  MyCalc
//
//  Created by Elena Chelyshkina on 22/08/2024.
//

import SwiftUI

@main
struct MyCalcApp: App {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
        }
    }
}
