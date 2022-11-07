//
//  testing22App.swift
//  testing22
//
//  Created by Raghavendra Raikar on 11/5/22.
//

import SwiftUI

@main
struct testing22App: App {
    var body: some Scene {
        WindowGroup {
            let weatherService = WeatherService()
            let viewModel = WeatherViewModel(weatherService: weatherService)
            //WeatherView(viewModel: viewModel)
            ContentView(viewModel: viewModel)
        }
    }
}
