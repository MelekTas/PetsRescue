//
//  OnboardingPage.swift
//  PetsRescue
//
//  Created by Sabrina Corrado on 22/10/2026.
//

import Foundation

struct OnboardingPage: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let description: String
}


extension OnboardingPage {
    static let pages: [OnboardingPage] = [
            OnboardingPage(
                icon: "cross.case.fill",
                title: "Help is one tap away",
                description: "Call rescue associations and vets in Naples in seconds. Every number works without internet."
            ),
            OnboardingPage(
                icon: "mappin.and.ellipse",
                title: "Bring them home",
                description: "Create a record for a missing animal and log every sighting with place, time and photos."
            ),
            OnboardingPage(
                icon: "book.fill",
                title: "Speak their language",
                description: "Short card lessons on training, hand signals and how to calm a scared animal."
            )
        ]
}
