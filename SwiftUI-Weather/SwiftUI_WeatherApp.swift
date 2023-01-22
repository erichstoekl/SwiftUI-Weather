//
//  SwiftUI_WeatherApp.swift
//  SwiftUI-Weather
//
//  Created by Erich Stoekl on 1/15/23.
//

import SwiftUI

@main
struct SwiftUI_WeatherApp: App {
    var network = Network()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
        }
    }
}
