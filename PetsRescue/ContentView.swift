//
//  ContentView.swift
//  PetsRescue
//
//  Created by Melek Tas on 20/10/2026.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some View {
        if hasSeenOnboarding {
            MainTabView()
        } else {
            OnboardingView()
        }
    }
} // to show the onboarding when you start the app

#Preview {
    ContentView()
}
