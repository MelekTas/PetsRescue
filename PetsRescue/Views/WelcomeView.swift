//
//  WelcomeView.swift
//  PetsRescue
//
//  Created by Sabrina Corrado on 22/10/2026.
//

import SwiftUI

struct WelcomeView: View {

    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Image("PawLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)

            Text("Welcome to Pet Rescue")
                .font(.system(size: 35, weight: .bold))
                .foregroundStyle(AppColor.teal)
                .multilineTextAlignment(.center)

            Spacer()

            Button {
                hasSeenOnboarding = true
            } label: {
                Text("Get started")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(AppColor.tealDark, in: Capsule())
            }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 8)
    }
}

#Preview {
    WelcomeView()
}
